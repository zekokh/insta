namespace :manager do
  desc "Сканирование инстаграмма"
  task start: :environment do
    Manager.start
  end

end
