---
--- @author Kadir#6666
--- Create at [19/05/2023] 10:09:26
--- Current project [Koy-V1]
--- File name [Jobs]
---

Enums.Jobs = {

    Center = {

        Events = {

            Server = {

                Join = "Koy:gamemode:jobs:center:join",
                Quit = "Koy:gamemode:jobs:center:quit"

            }

        }

    },

    Farm = {

        Events = {

            Server = {

                TakeService = "Koy:gamemode:jobs:farm:takeService",
                FinishMission = "Koy:gamemode:jobs:farm:finishMission",

            },

            Client = {

                ServiceUpdate = "Koy:gamemode:jobs:farm:serviceUpdate"

            }

        }

    }

}