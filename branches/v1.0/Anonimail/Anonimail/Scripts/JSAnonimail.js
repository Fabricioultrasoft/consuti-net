//---------------contador para ajax html editor-------------------//
// on Application load
Sys.Application.add_load(function () {
    var editor = $find("<%= TextoTextBox.ClientID %>");  // Editor's ID="myEditor"
    var editPanel = editor.get_editPanel();
    var designPanel = editPanel.get_modePanels()[AjaxControlToolkit.HTMLEditor.ActiveModeType.Design];


    editPanel._setActive_saved = editPanel._setActive;
    editPanel._setActive = function () {
        if (this.get_activeMode() == AjaxControlToolkit.HTMLEditor.ActiveModeType.Design) {
            var designPanel = this.get_activePanel();
            designPanel.onContentChanged();
        }
        this._setActive_saved();
    };


    designPanel.onContentChanged = function () {
        var innerText;


        if (AjaxControlToolkit.HTMLEditor.isIE) {
            innerText = this._doc.body.innerText;
        } else {
            var div1 = document.createElement("div");
            var html = new AjaxControlToolkit.HTMLEditor.jsDocument(true);
            AjaxControlToolkit.HTMLEditor.__MozillaGetInnerText(div1, html);
            innerText = html.toString();
            delete div1;
            delete html;
        }
        
        // HTML text length
        var htmlTextLength = AjaxControlToolkit.HTMLEditor.Trim(this._doc.body.innerHTML).length;
        
        // Plain text length
        var plainTextLength = AjaxControlToolkit.HTMLEditor.Trim(this._doc.body.innerText).length;
        //innerText.replace(/^[\s]+/g, "").replace(/[\s]+$/g, "").replace(/[\s]+/g, " ").length;
        
        // Place here your code:
        document.getElementById("totalHtml").value = htmlTextLength;
        document.getElementById("totalPlain").value = plainTextLength;
    }
});



//--------------contador para textbox comuns-------------------------//
var max = 1000;
function Contador(obj) {
    var progreso = document.getElementById("contador");

    if (obj.value.length > max) {
        obj.value = obj.value.substring(0, max);
    }

    progreso.innerHTML = " Limite de <b>" + max + "</b> caracteres | Restam: <b>" + (max - obj.value.length) + "</b>";
}