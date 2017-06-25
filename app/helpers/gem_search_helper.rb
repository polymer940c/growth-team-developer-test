module GemSearchHelper

    def self.search(gem)
        Gems.info gem
    end

    def self.title_info(result)
        show = Hash.new
        show['name'] = result['name']
        show['url'] = result['project_uri']
        show
    end

    def self.gem_detilas(result)
        show = Hash.new
        show['information'] = result['info']
        show
    end

    def self.get_dependencies(result)
        show = result['dependencies']['development']

        show.each do |dependent|
            dependent['url'] = 'https://rubygems.org/gems/' + dependent['name']
        end

        show
    end

end
