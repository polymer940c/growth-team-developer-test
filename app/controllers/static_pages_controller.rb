class StaticPagesController < ApplicationController
  helper GemSearchHelper
  def root
    if params['search_this']
      gem_search_return = GemSearchHelper.search(params['search_this'])
      if gem_search_return['search'] == 'no result'
        @no_match = gem_search_return
      else
        @title_info = GemSearchHelper.title_info(gem_search_return)
        @gem_detilas = GemSearchHelper.gem_detilas(gem_search_return)
        @dependencies = GemSearchHelper.get_dependencies(gem_search_return)
      end

    end

  end

  def favorites

    if params['favorites']
      favorites_array = params['favorites'].split(' ')
      @favorites = GemSearchHelper.append_url(favorites_array)
      render partial: "partials/favorites_list"
    else

    end

  end

end
