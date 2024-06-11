# Development Environment

## Seeding

1. `status_user_act`, `admin` default must be set by setup.sql
2. `team` must be set by `team-seed.sql` without leader defined
3. `user` must be downloaded from the Google sheet using prepared script.
4. default `group`: announcement, lost and found, support should be set behalf of the representative.
5. all user must be assigned to the announcement group and support mandatory.
6. lost and found group first be added, then user can unsubscribe from it.
7. all other members of announcement group should be reader only.
