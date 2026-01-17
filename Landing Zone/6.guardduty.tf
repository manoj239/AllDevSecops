#Enables GuardDuty in all Landing Zone accounts.

resource "aws_guardduty_detector" "master" {
  enable = true
}
