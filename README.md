# Overtime App

## Key requirement: A company need to log employees overtime hours.
- (Done) Post -> date:date rationale:text
- (Done) User -> Devise
- (Done) AdminUser -> STI(Single Table Inheritance)

## Features:
- Approval workflow
- SMS Sending -> link to approval or ovetime input
- (DONE) Administrate admin dashboard
- Block non-admin and guest user from admin dashboard
- Email summary to managers for approval
- Need to be documented of employee did not log overtime

## UI:
- (Done) Bootstrap -> formatting
- Icon from FontAwesome
- (DOING) Update bootstrap style for forms

##Test Driven Development Status:
- User:
  + (Done) Creation of User
- Post:
  + (DONE) Edit/Update post

##Refactor to-dos:
- User association integration test in post_spec.rb
- (DONE) Remove Sign-up function