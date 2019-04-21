local test ={}

function test.f6()
    --utils.print_r(ui.panelMain.components.list[1])
    ui.panelMain.gridView:show(ui.panelMain)
end

function test.f7()
    ui.panelMain.gridView:hide()
end

return test