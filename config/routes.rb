Rails.application.routes.draw do
  root "games#index"

  get  "search", to: "games#search"

  namespace "api" do
    resources "games", only: %i[index create update destroy]
  end
end
