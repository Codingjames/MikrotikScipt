# Criteria for find 
:local loglist [:toarray [/log find time>(/ system clock get time)-5m   message~"wrong password"]]

:foreach i in=$loglist do={

# find message
	:local logMessage [/log get $i message]
# find ip
	:local ip [:pick $logMessage 0 [:find $logMessage " "]]
                
# Add ip to access-list	
	#/ip firewall address-list add address=$ip list=L2tp_Attacker 
:log info message="script=IPSEC_catching Kick_ass=$ip"
}