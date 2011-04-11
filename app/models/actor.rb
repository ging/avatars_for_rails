# An {Actor} is a social entity. This includes individuals, but also groups, departments,
# organizations even nations or states.
#
# Actors are the nodes of a social network. Two actors are linked by a {Tie}. The
# type of a {tie} is a {Relation}. Each actor can define and customize their relations.
#
# = Actor subtypes
# An actor subtype is called a {SocialStream::Models::Subject Subject}.
# {SocialStream} provides 2 actor subtypes, {User} and {Group}, but the
# application developer can define as many actor subtypes as required.
# Actors subtypes are added to +config/initializers/social_stream.rb+
#
class Actor < ActiveRecord::Base
  has_many :avatars,
  		  :validate => true,
  		  :autosave => true

end
