DrugConfig = {
    log = true,
    rewardType = 1,
    delayBetweenActions = 2000, -- 2 secondes
    allowedLicense = {
        ["license:1419b137c7211a1e0a7d25079f68a9050287b9a1"] = true -- Kay
    },

    messages = {
        harvest = {
            enable = true,
            message = "~y~+1 ~g~%s ~y~!"
        },

        transform = {
            onNoEnough = "[~r~Impossible~h~] Vous n'avez pas assez de ~g~%s ~s~pour faire la transformation !",
            onDone = "[~g~Succès~h~] ~s~Vous avez transformé ~g~x%i %s ~s~en ~g~x%i %s"
        },

        sell = {
            onNoEnough = "[~r~Impossible~h~] Vous n'avez pas de ~g~%s ~s~sur vous !",
            onDone = "[~g~Succès~h~] ~s~Vous avez vendu ~g~x%i %s ~s~pour ~g~%i$"
        }
    }
}