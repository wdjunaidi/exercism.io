module App
  module User
    class Account
      attr_reader :user

      def initialize(user)
        @user = user
      end

      def username
        user.username
      end

      def github_url
        "https://github.com/#{username}"
      end

      def api_key
        user.key
      end

      def email
        user.email
      end

      def teams
        @teams ||= user.teams | user.managed_teams
      end

      def completed_in_tracks
        App::User::TruncatedExercises.by_track(user.exercises.completed)
      end
    end
  end
end
