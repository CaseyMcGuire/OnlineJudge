# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( *.js )
Rails.application.config.assets.precompile += %w( bootstrap.js )
#Rails.application.config.assets.precompile += [/.*\.js/,/.*\.css/]
Rails.application.config.assets.precompile += %w( application.css.scss )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( boostrap-theme.min.css )
Rails.application.config.assets.precompile += %w( home.css.scss )
Rails.application.config.assets.precompile += %w( languages.css.scss )
Rails.application.config.assets.precompile += %w( problems.css.scss )
Rails.application.config.assets.precompile += %w( profile.css.scss )
Rails.application.config.assets.precompile += %w( results.css.scss )
Rails.application.config.assets.precompile += %w( statuses.css.scss )
Rails.application.config.assets.precompile += %w( submissions.css.scss )
Rails.application.config.assets.precompile += %w( tests.css.scss )
#Rails.application.config.assets.precompile = false
# Precompile additional assets
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
