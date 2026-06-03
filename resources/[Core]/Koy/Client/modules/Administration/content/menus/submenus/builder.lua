local AdminStorage = Shared.Storage:Get("Administration");
local builder_menu = AdminStorage:Get("admin_builder");

builder_menu:IsVisible(function(Items)
    Items:Button("Gang Builder", nil, {}, true, {
        onSelected = function()
            ExecuteCommand("buildergang")
            RageUI.CloseAll()
        end
    });
    
    Items:Button("Job Builder", nil, {}, true, {
        onSelected = function()
            ExecuteCommand("jobbuilder")
            RageUI.CloseAll()
        end
    });
end); 