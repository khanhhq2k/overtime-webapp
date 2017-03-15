# Overtime App

## Key requirement: A company need to log employees overtime hours.
- (Done) Post -> date:date rationale:text
-	(Done) User -> Devise
- (Done) AdminUser -> STI(Single Table Inheritance)

## Features:
- Approval workflow
- SMS Sending -> link to approval or ovetime input
- Administrate admin dashboard
- Email summary to managers for approval
- Need to be documented of employee did not log overtime

## UI:
- (Done) Bootstrap -> formating
- Icon from FontAwesome
- Update bootstrap style for forms

##Test Driven Development Status:
- User:
	+ (Done) Creation of User
- Post:
	+ Edit/Update post

##Refactor to-dos:
- User association integration test in post_spec.rb