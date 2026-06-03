-- Vérifier si la classe Key existe avant de l'étendre
if not Key then
    print("^1[ERREUR] La classe Key n'est pas disponible lors de l'initialisation de VehicleKey. Veuillez vérifier l'ordre de chargement.^7")
    return
end

VehicleKey = Class.extends(Key, function(class) 

    ---@class VehicleKey: Key
    local self = class;

    function self:Constructor(owner, keyId, handle)
        self.handle = handle;
        self:super(owner, keyId);
    end

    ---@param handle number
    function self:AddHandle(handle)
        self.handle = handle;
    end

    ---Remove vehicle associated with key
    function self:RemoveHandle()
        self.handle = nil;
    end

    ---@return number
    function self:GetHandle()
        return self.handle;
    end

    return self;
end);