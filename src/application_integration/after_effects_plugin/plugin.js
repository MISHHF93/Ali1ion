// plugin.js

(function(thisObj) {
    function buildUI(thisObj) {
        var myPanel = (thisObj instanceof Panel) ? thisObj : new Window("palette", "Ali1ion Plugin", undefined, {resizeable: true});
        
        // UI elements
        var res = "group { orientation:'column', alignment:['fill','fill'], \
                        header: Group { alignment:['fill','top'], \
                            title: StaticText { text:'Ali1ion Plugin', alignment:['fill','center'] }, \
                        }, \
                        main: Group { alignment:['fill','fill'], \
                            message: StaticText { text:'Hello from Ali1ion!', alignment:['fill','center'] }, \
                        }, \
                        footer: Group { alignment:['fill','bottom'], \
                            btnGroup: Group { alignment:['right',''], \
                                runBtn: Button { text:'Run', preferredSize:[-1,20] }, \
                                closeBtn: Button { text:'Close', preferredSize:[-1,20] }, \
                            }, \
                        }, \
                    }";

        myPanel.grp = myPanel.add(res);

        myPanel.grp.footer.btnGroup.runBtn.onClick = function() {
            alert("Ali1ion Plugin is running!");
            // Add your plugin functionality here
            app.beginUndoGroup("Ali1ion Plugin");
            try {
                var comp = app.project.activeItem;
                if (!comp || !(comp instanceof CompItem)) {
                    alert("Please select or open a composition first.");
                    return;
                }

                var textLayer = comp.layers.addText("Generated by Ali1ion Plugin");
                textLayer.name = "Ali1ion Text Layer";

                var textProp = textLayer.property("Source Text");
                var textDocument = textProp.value;
                textDocument.fontSize = 50;
                textDocument.fillColor = [1, 1, 1]; // White color
                textDocument.justification = ParagraphJustification.CENTER_JUSTIFY;
                textProp.setValue(textDocument);

                alert("Ali1ion Plugin applied successfully.");
            } catch (e) {
                alert("Error: " + e.toString());
            } finally {
                app.endUndoGroup();
            }
        };

        myPanel.grp.footer.btnGroup.closeBtn.onClick = function() {
            myPanel.close();
        };

        myPanel.layout.layout(true);
        return myPanel;
    }

    var myScriptPal = buildUI(thisObj);
    if (myScriptPal instanceof Window) {
        myScriptPal.center();
        myScriptPal.show();
    }

})(this);
