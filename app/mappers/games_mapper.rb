class GamesMapper < Dry::Transformer::Pipe
  import Dry::Transformer::ArrayTransformations
  import Dry::Transformer::HashTransformations

  define! do
    map_array do
      symbolize_keys
      accept_keys([
        :publisher_id,
        :name,
        :os,
        :app_id,
        :bundle_id,
        :version
      ])
      rename_keys(
        os: :platform,
        app_id: :store_id,
        version: :app_version
      )
    end
  end
end
