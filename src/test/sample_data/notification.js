    /**
     * AUTHOR       : Mark Dinglasa
     * COMMENT/S    : TEST DATA SAMPE
     * CHANGES      : N/A
     * LOG-DATE     : 2024-05-27 11:48PM
    */
   
    // create new notification
    export const notification_create = {
        "UserId":1,
        "Description":"test data1",
        "LinkedComponent":"/ticket/details/2",
        "Status":1
    }

    // remove multiple notifcations
    export const notifcation_remove_multiple =  {
        "data": [
            {"Id":1},
            {"Id":3},
            {"Id":4},
            {"Id":5},
            {"Id":6},
            {"Id":7}
        ]
    }