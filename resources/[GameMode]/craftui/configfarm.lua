ConfigFarms = {}

ConfigFarms.FarmZones = {
    citron_vert = {
        jobs = {'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Citron Vert",
            sprite = 57,
            color = 2,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(2329.981934, 5013.367188, 42.559986),
                item = {
                    name = "lime",
                    label = "Citron Vert",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    citron_jaune = {
        jobs = {'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Citron Jaune",
            sprite = 57,
            color = 5,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(2353.131348, 4981.060059, 42.951458),
                item = {
                    name = "lemon",
                    label = "Citron Jaune",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    miel = {
        jobs = {'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Miel",
            sprite = 57,
            color = 44,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(2718.270264, 1560.754272, 20.823515),
                item = {
                    name = "honey",
                    label = "Miel",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    menthe = {
        jobs = {'henhouse', 'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Menthe",
            sprite = 57,
            color = 25,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(1476.022339, -2511.380615, 55.144493),
                item = {
                    name = "menthe",
                    label = "Feuille de Menthe",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    fraise = {
        jobs = {'henhouse', 'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Fraise",
            sprite = 57,
            color = 49,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(-2367.649658, 2794.481445, 3.105639),
                item = {
                    name = "strawberries",
                    label = "Fraise",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    framboise = {
        jobs = {'henhouse', 'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Framboise",
            sprite = 57,
            color = 34,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(-2115.980225, 2677.588623, 2.874675),
                item = {
                    name = "raspberries",
                    label = "Framboise",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },

    cerise = {
        jobs = {'henhouse', 'bahamas', 'unicorn'}, 
        blip = {
            name = "Zone de récolte - Cerise",
            sprite = 57,
            color = 19,
            scale = 0.6
        },
        positions = {
            {
                coords = vector3(22.135489, 3194.983643, 35.386517),
                item = {
                    name = "cherries",
                    label = "Cerise",
                    time = 5000,
                    animation = {
                        dict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@",
                        anim = "weed_crouch_checkingleaves_idle_01_inspector"
                    }
                }
            },
        }
    },
    
} 