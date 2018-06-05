require 'json'
require 'rest-client'

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '2s', :first_in => 0 do |job|
  url = "http://localhost:3232/v1/readings"
  
  res = RestClient.get(url)
  if res.code == 200
    json = JSON.parse(res.body)

    # json["irrig_ec"] = 2.3
    # json["runoff_ec"] = 3.2
    # json["irrig_ph"] = 6.9
    # json["runoff_ph"] = 7.2
    # json["irrig_ectemp"] = 20.2
    # json["runoff_ectemp"] = 19.1
    # json["irrig_volume"] = 320
    # json["runoff_volume"] = 450
    # json["runoff_ratio"] = 28.2313546

    send_event('ec1', {           current: (json["irrig_ec"].round(1)       rescue "!")   })
    send_event('ec2', {           current: (json["runoff_ec"].round(1)      rescue "!")   })

    send_event('ph1', {           current: (json["irrig_ph"].round(1)       rescue "!")   })
    send_event('ph2', {           current: (json["runoff_ph"].round(1)      rescue "!")   })

    send_event('temp1', {         current: (json["irrig_ectemp"].round(1)   rescue "!")   })
    send_event('temp2', {         current: (json["runoff_ectemp"].round(1)  rescue "!")   })

    send_event('tb1_volume', {    current: (json["irrig_volume"].round(0)   rescue "!")   })
    send_event('tb2_volume', {    current: (json["runoff_volume"].round(0)  rescue "!")   })
    
    send_event('ratio', {         current: (json["runoff_ratio"].round(1)   rescue "!")   })

  end
end
