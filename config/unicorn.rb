development:
  working_directory "/home/yanaizmene/www/rails/booker"
  pid "/home/yanaizmene/www/rails/booker/pids/unicorn.pid"
  stderr_path "/home/yanaizmene/www/rails/booker/log/unicorn.log"
  stdout_path "/home/yanaizmene/www/rails/booker/log/unicorn.log"
  listen "/tmp/unicorn.booker.sock"
  worker_processes 2
  timeout 30

test:
  working_directory "/apps/booker/current"
  pid "/apps/booker/current/pids/unicorn.pid"
  stderr_path "/apps/booker/current/log/unicorn.log"
  stdout_path "/apps/booker/current/log/unicorn.log"
  listen "/tmp/unicorn.booker.sock"
  worker_processes 2
  timeout 30
