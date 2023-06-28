# Incident report analysis


| **Sumary** | Our organization’s network services suddenly stopped responding due to an incoming flood of ICMP packets. Normal internal network traffic could not access any network resources. The team responded by blocking the attack and stopping all non-critical network services, so that critical network services could be restored. |
| ----------- | ----------- |
| Identify | The company’s cybersecurity team investigated the security event. They found that a malicious actor had sent a flood of ICMP pings into the company’s network through an unconfigured firewall. This vulnerability allowed the malicious attacker to overwhelm the company’s network through a distributed denial of service (DDoS) attack. |
| Protect | The network security team implemented new security policies to prevent future DDos: a new firewall rule to limit the rate of incoming ICMP packets, source IP verification on the firewall to check for spoofed Ip addresses on incoming ICMP packets, network monitoring software to detect abnormal traffic patterns and IDS/IPS system to filter out some ICMP traffic based on suspicious characteristics. |
| Detect | To detect new unauthorized access attacks in the future, the team will use a firewall logging tool and an intrusion detection system (IDS) to monitor allincoming traffic from the internet. The team will also use network monitoring software to detect abnormal traffic patterns. |
| Respond | For future security events, the cybersecurity team will isolate affected systems to prevent further disruption to the network. They will attempt to restore any critical systems and services that were disrupted by the event. Then, the team will analyze network logs to check for suspicious and abnormal activity. The team will also report all incidents to upper management and appropriate legal authorities, if applicable. |
| Recover | The team has already recovered from the DDoS attack, now the objective is to start running all the new security measures in order to make this kind of attack less likely to happen. In the future, external ICMP flood attacks can be blocked at the firewall. Then, all non-critical network services should be stopped to reduce internal network traffic. Next, critical network services should be restored first. Finally, once the flood of ICMP packets have timed out, all non-critical network systems and services can be brought back online. |

| Reflections/Notes: |
| ----------- |
