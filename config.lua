config = {
    --------------------
    --- Main Config
    --------------------
    webhookURL = "", -- Send Log to Discord 
    AcePerm = "silent.alarm", -- Ace Perm that Receives the Alarm Notification (Police)
    Cooldown = 60, -- in seconds (will probaby update to minutes next update)
    --------------------
    --- Coords 
    --------------------
    shopcoords = {
        {name = "24/7 on Senora Fwy ", alarm = "24/7 on Senora Fwy! All police units are required to assist!", 
        x = 1734.54, y = 6420.27, z = 35.04, distance = 1.5},

        {name = "24/7 on Senora Fwy ", alarm = "24/7 on Senora Fwy! All police units are required to assist!", 
        x = 2673.21, y = 3286.36, z = 55.24, distance = 1.5},

        {name = "24/7 in Harmony", alarm = "24/7 on Harmony! All police units are required to assist!", 
        x = 546.35, y = 2663.35, z = 42.16, distance = 1.5},

        {name = "24/7 in Sandy", alarm = "24/7 in Sandy Shores! All police units are required to assist!", 
        x = 1959.27, y = 3748.98, z = 32.34, distance = 1.5},

        {name = "24/7 on Palomino Fwy", alarm = "24/7 on Palomino Fwy! All police units are required to assist!", 
        x = 2549.84, y = 384.93, z = 108.64, distance = 1.5},

        {name = "24/7 on Vinewood", alarm = "24/7 in Vinewood! All police units are required to assist!", 
        x = 377.99, y = 332.96, z = 103.57, distance = 1.5},

        {name = "24/7 on Strawberry", alarm = "24/7 in Strawberry! All police units are required to assist!", 
        x = 28.71, y = -1339.51, z = 29.5, distance = 1.5},
        --------------------
        --- Notifications - For Multi Notifications (will be added next update)
        --------------------
        Notify = 0,
        NotifyDuration = 10000
    },
}