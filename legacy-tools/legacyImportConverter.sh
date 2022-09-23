#! /bin/bash

### DOES NOT WORK ###
### Storing the replaces here for the time being ###

# IMPORTANT: You will have to manually add to the very last line of the `visitor_action_log` the ON DUPLICATE KEY statement below, unless we find a good way of adding it with this script

# Search: ;\nINSERT INTO `visitor_action_log` (`ip_address`, `user_id`, `session_id`, `time`, `action`, `associated_id`, `zip_code`, `organization_id`) VALUES
# Add before: ON DUPLICATE KEY UPDATE `time` = TIMESTAMPADD(MICROSECOND, FLOOR(1 + RAND() * 100), `time`)

perl -i -p0e "s/(;\nINSERT INTO `visitor_action_log` \(`ip_address`, `user_id`, `session_id`, `time`, `action`, `associated_id`, `zip_code`, `organization_id`\) VALUES)/\nON DUPLICATE KEY UPDATE `time` = TIMESTAMPADD(MICROSECOND, FLOOR(1 + RAND() * 999999), `time`)\$1/g" $1
