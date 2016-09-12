var hostname = window.location.hostname;
var connectedToServer = false;
var isMobile = false; //initiate as false
var connectedPrinterIDs = new Array();
var connectedPrinters = new Array();

function id2Index(tabsId, srcId)
{
    var index = -1;
    var i = 0, tbH = $(tabsId).find("li a");
    var lntb = tbH.length;
    if (lntb > 0) {
        for (i = 0; i < lntb; i++) {
            o = tbH[i];
            if (o.href.search(srcId) > 0) {
                index = i;
            }
        }
    }
    return index;
}

function processAddedAndRemovedPrinters(printerIDs)
{
    var printersToDelete = new Array();
    var printersToAdd = new Array();

    for (var printerIDIndex = 0; printerIDIndex < connectedPrinterIDs.length; printerIDIndex++)
    {
        var printerIDToConsider = connectedPrinterIDs[printerIDIndex];

        if (printerIDs.indexOf(printerIDToConsider) < 0)
        {
            //Not in the list of discovered printers - we need to delete it
            printersToDelete.push(printerIDToConsider);
        }
    }

    for (var printerIDIndex = 0; printerIDIndex < printerIDs.length; printerIDIndex++)
    {
        var printerIDToConsider = printerIDs[printerIDIndex];

        if (connectedPrinterIDs.indexOf(printerIDToConsider) < 0)
        {
            //Not in the list - we need to add it
            printersToAdd.push(printerIDToConsider);
        }
    }

    printersToDelete.forEach(deletePrinter);
    printersToAdd.forEach(addPrinter);
}

function addPrinter(printerID)
{
    connectedPrinterIDs.push(printerID);

    getPrinterStatus(printerID, function (data) {
        connectedPrinters.push(null);
        var numberOfNozzles = 0;
        if (data.nozzleTemperature !== null)
        {
            numberOfNozzles = data.nozzleTemperature.length;
        }
        addCollapsible(printerID, numberOfNozzles);
    });
}

function deletePrinter(printerID)
{
    var indexToDelete = connectedPrinterIDs.indexOf(printerID);

    connectedPrinterIDs.splice(indexToDelete, 1);
    connectedPrinters.splice(indexToDelete, 1);
    removeCollapsible(printerID);
}

function createPrinterDataTable(printerID, numberOfNozzles)
{
    var rowCounter = 1;
    var printerStatusTable = "<table data-role=\"table\" data-mode=\"reflow\" class=\"status-table ui-responsive\"> \
    <thead> \
  <tr> \
    <th data-priority=\"1\"></th>\
    <th data-priority=\"2\"></th>\
  </tr> \
  </thead> \
  <tbody> \
  <tr>\
    <td class=\"title\">Status</td>\
    <td id='"
            + printerID
            + "_statusDisplay'>?</td>\
  </tr>";
    for (var nozzleNumber = 0; nozzleNumber < numberOfNozzles; nozzleNumber++)
    {
        rowCounter++;
        printerStatusTable += "<tr>\
    <td class=\"title\">Nozzle " + nozzleNumber + " Temperature</td>\
    <td id='"
                + printerID
                + "_nozzle" + nozzleNumber + "TemperatureDisplay'></td>\
  </tr>";
    }

    printerStatusTable += "</tbody></table>";

    return printerStatusTable;
}

function addCollapsible(tab_name, numberOfNozzles)
{
    var newCollapsible = "<div id=\"printerCollapsible_" + tab_name + "\" data-role=\"collapsible\">"
            + "<h4 id=\"printerTabTop_" + tab_name + "\">" + tab_name + "</h4>"
            + "<div id='printerTab_" + tab_name + "'>"
            + createPrinterDataTable(tab_name, numberOfNozzles)
            + "<div id='printerTabButtons_" + tab_name + "'/>"
            + "</div></div></div>";

    $("#printerTabs").append(newCollapsible).collapsibleset('refresh');
}

function removeCollapsible(tab_name)
{
    $('#printerCollapsible_' + tab_name).remove();
    $("#printerTabs").append(content).collapsibleset('refresh');
}

function removeAllPrinterTabs()
{
    connectedPrinterIDs.forEach(function (connectedPrinter) {
        console.log("Deleting printer  " + connectedPrinter);
        deletePrinter(connectedPrinter);
    });
}

function conditionallyCreateButton(createButton, divToAddButtonTo, buttonText, onClickFunction, printerID)
{
    if (createButton)
    {
        divToAddButtonTo.append('<button class="ui-shadow ui-btn ui-corner-all ui-mini ui-btn-inline" onClick="'
                + onClickFunction.name + '(\'' + printerID + '\')">'
                + buttonText
                + '</button>');
//        divToAddButtonTo.append('<div align="center">'
//                + '<button class="ui-shadow ui-btn ui-corner-all ui-btn-inline" onClick="'
//                + onClickFunction.name + '(\'' + printerID + '\')">'
//                + buttonText
//                + '</button>'
//                + '</div>');
    }
}

function printGCodeFile(printerID)
{
//    var filename = $('#fileInput_' + printerID).val().split('\\').pop();

    var data = new FormData($('#fileInput_' + printerID).val());
//    jQuery.each(jQuery('#file')[0].files, function (i, file) {
//        data.append('file-' + i, file);
//    });
    jQuery.ajax({
        url: 'http://' + hostname + ':9000/api/' + printerID + '/remoteControl/upload/',
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function (data) {
            alert(data);
        }
    });
}

function openDoor(printerID)
{
    postCommandToRoot(printerID, "openDoor", null, safetiesOn().toString());
}

function pausePrint(printerID)
{
    postCommandToRoot(printerID, "pause", null, null);
}

function resumePrint(printerID)
{
    postCommandToRoot(printerID, "resume", null, null);
}

function cancelPrint(printerID)
{
    postCommandToRoot(printerID, "cancel", null, null);
}

function removeHead(printerID)
{
    postCommandToRoot(printerID, "removeHead", null, null);
}

function purgeHead(printerID)
{
    postCommandToRoot(printerID, "purge", null, safetiesOn().toString());
}

function configurePrinterButtons(printerID, printerData)
{
    var lastPrinterData = connectedPrinters[connectedPrinterIDs.indexOf(printerID)];

    if (lastPrinterData === null
            || printerData.canPause !== lastPrinterData.canPause
            || printerData.canResume !== lastPrinterData.canResume
            || printerData.canRemoveHead !== lastPrinterData.canRemoveHead
            || printerData.canOpenDoor !== lastPrinterData.canOpenDoor
            || printerData.canCancel !== lastPrinterData.canCancel
            || printerData.canCalibrateHead !== lastPrinterData.canCalibrateHead
            || printerData.canPurgeHead !== lastPrinterData.canPurgeHead)
    {
        $("div#printerTabButtons_" + printerID).empty();

        conditionallyCreateButton(printerData.canPause, $("div#printerTabButtons_" + printerID), "Pause", pausePrint, printerID);
        conditionallyCreateButton(printerData.canResume, $("div#printerTabButtons_" + printerID), "Resume", resumePrint, printerID);
        conditionallyCreateButton(printerData.canCancel, $("div#printerTabButtons_" + printerID), "Cancel", cancelPrint, printerID);
        conditionallyCreateButton(printerData.canOpenDoor, $("div#printerTabButtons_" + printerID), "Open Door", openDoor, printerID);
        conditionallyCreateButton(printerData.canRemoveHead, $("div#printerTabButtons_" + printerID), "Remove Head", removeHead, printerID);
        conditionallyCreateButton(printerData.canPurgeHead, $("div#printerTabButtons_" + printerID), "Purge Head", purgeHead, printerID);

        if (!isMobile && printerData.canPrint)
        {
            $("div#printerTabButtons_" + printerID).append('<form id="fileUpload_' + printerID + '" enctype="multipart/form-data">'
                    + '<input type="submit" value="Send GCode to printer">'
                    + '<input id="fileInput_' + printerID + '" type="file" name="file" required/></form>');

            $('#fileUpload_' + printerID).submit(function (event) {
                event.preventDefault();
                var formData = new FormData($(this)[0]);

                $.ajax({
                    url: 'http://' + hostname + ':9000/api/' + printerID + '/remoteControl/printGCodeFile/',
                    type: 'POST',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (returndata) {
                        alert(returndata);
                    },
                    error: function () {
                        alert("error in ajax form submission");
                    }
                });

                return false;
            });
        }
    }
}

function updateAndDisplayPrinterStatus(printerID)
{
    getPrinterStatus(printerID, function (printerData) {
        $('#printerTabTop_' + printerID + " a").text(printerData.printerName + " - " + printerData.printerStatusString);
        $('#printerTab_' + printerID).find('#' + printerID + '_statusDisplay').text(printerData.printerStatusString);
        for (var nozzleNum = 0; nozzleNum < printerData.nozzleTemperature.length;
                nozzleNum++
                )
        {
            $('#printerTab_' + printerID).find('#' + printerID + '_nozzle' + nozzleNum + 'TemperatureDisplay').text(printerData.nozzleTemperature[nozzleNum]);
        }

        configurePrinterButtons(printerID, printerData);

        connectedPrinters.splice(connectedPrinterIDs.indexOf(printerID), 1, printerData);
    });
}

function postCommandToRoot(printerID, service, successCallback, dataToSend)
{
    var printerURL = "http://" + hostname + ":9000/api/" + printerID + "/remoteControl/" + service;
    $.ajax({
        url: printerURL,
        dataType: "xml/html/script/json", // expected format for response
        contentType: "application/json", // send as JSON
        type: 'POST',
        data: JSON.stringify(dataToSend)
    }).done(function (data)
    {
        if (successCallback !== null)
        {
            successCallback(data);
        }
    }).complete();
}



function getPrinterStatus(printerID, callback)
{
    var printerURL = "http://" + hostname + ":9000/api/" + printerID + "/remoteControl";
    $.ajax({
        url: printerURL,
        dataType: 'json',
        type: 'GET',
    }).done(function (data)
    {
        callback(data);
    }).complete();
}

function updatePrinterStatuses()
{
    for (var printerIndex = 0; printerIndex < connectedPrinterIDs.length; printerIndex++)
    {
        $("#no-printers-connected-text").hide();
        var printerID = connectedPrinterIDs[printerIndex];
//                    console.log("Updating printer " + printerID);
        updateAndDisplayPrinterStatus(printerID);
    }

    if (connectedPrinterIDs.length === 0)
    {
        $("#no-printers-connected-text").show();
    }
}

function updateServerStatus(serverVersion)
{
    $('#serverVersion').text('Server version: ' + serverVersion);
}

function getServerStatus()
{
    $.ajax({
        url: 'http://' + hostname + ':9000/api/discovery/whoareyou',
        dataType: 'json',
        type: 'GET',
        success: function (data, textStatus, jqXHR) {
            $('#serverOnline').text('Server ONLINE');
            updateServerStatus(data.serverVersion);
            connectedToServer = true;
        },
        error: function (xhr, ajaxOptions, thrownError) {
            connectedToServer = false;
            $('#serverOnline').text('Server OFFLINE');
            removeAllPrinterTabs();
            updateServerStatus("-");
        }
    });
}

function getPrinters()
{
    $.ajax({
        url: 'http://' + hostname + ':9000/api/discovery/listPrinters',
        dataType: 'json',
        type: 'GET',
        success: function (data, textStatus, jqXHR) {
            processAddedAndRemovedPrinters(data.printerIDs);
            updatePrinterStatuses();
            connectedToServer = true;
        },
        error: function (xhr, ajaxOptions, thrownError) {
            connectedToServer = false;
            $('#serverOnline').text('Server OFFLINE');
            removeAllPrinterTabs();
        }
    });
}

function getStatus()
{
    if (!connectedToServer)
    {
        getServerStatus();
    }
    else
    {
        getPrinters();
    }
}

function safetiesOn()
{
    var safetyStatus = $("#safeties-switch").prop("checked") ? true : false;

    return safetyStatus;
}

$(document).ready(function () {
    // device detection
    if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|ipad|iris|kindle|Android|Silk|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(navigator.userAgent)
            || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(navigator.userAgent.substr(0, 4)))
    {
        isMobile = true;
    }

    getServerStatus();
    setInterval(getStatus, 2000);
    $('#printerTabs').tabs({
        active: 1
    });
});