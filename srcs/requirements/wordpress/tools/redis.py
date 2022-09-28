file = open("/var/www/html/wp-config.php", "r+")
buf = file.readlines()
buf.insert(buf.index('define( \'DB_COLLATE\', \'\' );\n') + 1, 'define(\'WP_REDIS_PORT\', 6379);\n')
buf.insert(buf.index('define( \'DB_COLLATE\', \'\' );\n') + 2, 'define(\'WP_REDIS_HOST\', \'redis\');\n')
buf.insert(buf.index('define( \'DB_COLLATE\', \'\' );\n') + 3, 'define(\'WP_CACHE_KEY_SALT\',\'randominception\');\n')
outfile = open("/var/www/html/wp-config.php", "w+")
for l in buf:
	outfile.write(l)
print("ℹ️  Added redis config to wp-config.php")


