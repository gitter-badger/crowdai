class ParticipantChallenge < SqlView
  self.primary_key = :id
  after_initialize :readonly!

  belongs_to :challenge
  belongs_to :participant
end


# This view calculates which challenges a participant is connected with, based on:
# - submissions made
# - challenge forum topics entered
# - challenge forum posts entered
# - challenge data files downloaded

# For convenience, it also includes useful fields from the participants and challenges tables
