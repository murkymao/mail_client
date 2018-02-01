require 'pony'
require 'io/console/size'

my_mail = "murkymao@gmail.com"

puts "Введите пароль от Вашей почты #{my_mail} для отправки письма"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо?"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp

Pony.mail(
    {
        :subject => "Привет из руби!",
    :body => body,
    :to => send_to,
    :from => my_mail,

    :via => :smtp,
    :via_options => {
                  :address => 'smtp.gmail.com', # это хост, сервер отправики
                  :port => '465', # порт
                  :tls => true, # если сервер работает в режиме ТЛС
                  :user_name => my_mail, #
                  :password => password, #
                  :authentication => :plain # "обычный" тип авторизации


    }
    }

)

puts "Письмо успешно отправлено!"
