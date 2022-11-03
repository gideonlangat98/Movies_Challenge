class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    def cast_role(actor, character_name, salary)
        self.roles << Role.create(actor: actor, character_name: character_name, salary: salary)
    end

    def all_credits
        self.roles.map { |role| "#{role.character_name}: Played by #{role.actor.name}"}
    end

    def fire_actor(actor)
        fired_actor = self.roles.find { |role| role.actor == actor}
        fired_actor.delete
    end
end