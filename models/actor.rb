class Actor < ActiveRecord::Base
    has_many :roles
    has_many :movies, through: :roles

    def total_salary
        self.roles.map { |role| role.salary}.sum
    end

    def blockbusters
        self.movies.filter { |movie| movie.box_office_earnings > 50_000_000 }
        # self.movies.where ("movies.box_office_earnings > ?", 50_000_000)
    end

    def self.most_successful
        # def self.most_successful
    #   successful_actor = 0
    #   current_actor_id = 0
    #   self.all.each do |actor| 
    #     if (actor.total_salary > successful_actor)
    #       successful_actor = actor.total_salary
    #       current_actor_id = actor.id
    #     end
    #   end
    #   self.all.find(current_actor_id)
    # end

    Actor.all.max_by { |actor| actor.total_salary}
    end
end