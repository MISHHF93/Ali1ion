// plugin.js

(function(thisObj) {
    function buildUI(thisObj) {
        var myPanel = (thisObj instanceof Panel) ? thisObj : new Window("palette", "NAO-AI Plugin", undefined, {resizeable: true});
        
        // UI elements
        var res = "group { orientation:'column', alignment:['fill','fill'], \
                        header: Group { alignment:['fill','top'], \
                            title: StaticText { text:'NAO-AI Plugin', alignment:['fill','center'] }, \
                        }, \
                        main: Group { alignment:['fill','fill'], \
                            message: StaticText { text:'Hello from NAO-AI!', alignment:['fill','center'] }, \
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
            alert("NAO-AI Plugin is running!");
            // Add your plugin functionality here
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
