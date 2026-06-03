Config = {
    CommandName = 'buildergang',
    F7MenuKey = 168,
    
    FounderPermission = 'founder',
    
    DefaultPositions = {
        Coffre = vector3(0.0, 0.0, 0.0),
        Patron = vector3(0.0, 0.0, 0.0),
        Garage = vector3(0.0, 0.0, 0.0),
        SuppressionVehicule = vector3(0.0, 0.0, 0.0),
        SpawnVehicule = vector3(0.0, 0.0, 0.0),
        Vestiaire = vector3(0.0, 0.0, 0.0),
        Blip = vector3(0.0, 0.0, 0.0)
    },
    
    DefaultVehicles = {
        {model = 'sultan', label = 'Sultan'}
    },
    
    DefaultMaxTenues = 10,
    
    DefaultGarageSize = 10,
    
    DefaultCoffreWeight = 100,
    
    Messages = {
        GangCreated = 'Le gang a été créé avec succès',
        GangModified = 'Le gang a été modifié avec succès',
        GangDeleted = 'Le gang a été supprimé avec succès',
        GradeCreated = 'Le grade a été créé avec succès',
        GradeDeleted = 'Le grade a été supprimé avec succès',
        NoPermission = 'Vous n\'avez pas la permission d\'utiliser cette commande',
        PositionSaved = 'La position a été sauvegardée',
        ValueModified = 'La valeur a été modifiée'
    }
} 