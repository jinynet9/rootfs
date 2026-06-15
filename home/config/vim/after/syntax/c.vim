
"
" /.../ pattern
" \<  start word
" \?  optional
" \\?  optional, insert regular expression to string
" \w* alpha, digit, underline
" \>  end word
"
" :colorscheme default
" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" zeblib
"

"syntax match userFunc /\<_\?pktsvr_\\?\w*\>/
"syntax match userFunc /\<_\?pktarc_\?\w*\>/

" Match function call pattern, not the '('
" \s*(
" me=e-1   match end (-1, except '(')
syntax match userFunc /\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*(/me=e-1

"highlight userFunc ctermfg=Yellow guifg=#DEB887 gui=NONE " BurlyWood
"highlight userFunc ctermfg=Yellow guifg=#F4A460 gui=NONE " SandyBrown
"highlight userFunc ctermfg=Yellow guifg=#CD853F gui=NONE " Peru
"highlight userFunc ctermfg=Yellow guifg=#FF8C00 gui=NONE " DarkOrange
highlight userFunc ctermfg=Yellow guifg=#D2691E gui=NONE " Chocolate
"hi link userFunc Function

"
" constant
"
syntax match userConst /\<FOR_EACH_\w*\>/
syntax keyword userConst TIME_MEASURE

highlight userConst ctermfg=Yellow guifg=#D2691E gui=italic " Chocolate

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" special operators
"

"syntax match specOper /\*\+/ " *, **, ***, ...
syntax match specOper /[+\-*]/
syntax match specOper /&/
syntax match specOper /\./
syntax match specOper /!/
syntax match specOper /=/
syntax match specOper /->/
syntax match specOper /||/
syntax match specOper /&&/
syntax match specOper /++/
syntax match specOper /+=/
syntax match specOper /--/
syntax match specOper /-=/
syntax match specOper /*=/
syntax match specOper /\\=/
syntax match specOper /==/
syntax match specOper /<=/
syntax match specOper />=/
syntax match specOper /!=/
syntax match specOper /\\/
"" C-style block comment
"syntax region CComment start=/\/\*/ end=/\*\//
"" include <...>
"syntax region cIncluded start=/</ end=/>/
""syntax match specOper /[<>]/ containedin=ALLBUT,CComment,cIncluded
"
highlight specOper ctermfg=Yellow guifg=#CC0000 gui=NONE " chrysler red


syntax match specParen /[{}()\[\]]/ containedin=ALL

"highlight specParen ctermfg=Green guifg=#e06c75 " 
"highlight specParen ctermfg=Green guifg=#c678d0 " 
highlight specParen ctermfg=Green guifg=#800080 " purple


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" zeblib
"

syntax match zenlibFunc /\<zerr\w*\>/
syntax match zenlibFunc /\<vfs_\w*\>/
syntax match zenlibFunc /\<slist_\w*\>/
syntax match zenlibFunc /\<dlist_\w*\>/
syntax match zenlibFunc /\<sklist_\w*\>/
syntax match zenlibFunc /\<sys_\w*\>/
syntax match zenlibFunc /\<sock_\w*\>/
syntax match zenlibFunc /\<time_\w*\>/
syntax match zenlibFunc /\<str2\w*\>/
syntax match zenlibFunc /\<SYSTEM_\?\w*\>/

"highlight zenlibFunc ctermfg=Yellow guifg=#828282 " Charcoal Gray
"highlight zenlibFunc ctermfg=Yellow guifg=#FFC080 " Buttery
"highlight zenlibFunc ctermfg=Yellow guifg=#7EB09B " Olive Green
"highlight zenlibFunc ctermfg=Yellow guifg=#9932CC " darkorchid
"highlight zenlibFunc ctermfg=Yellow guifg=#FF66FF " Magenta (#FF66FF)
"highlight zenlibFunc ctermfg=Yellow guifg=#FF8C00 " darkorange
"highlight zenlibFunc ctermfg=Yellow guifg=#FF7F50 " Coral
"highlight zenlibFunc ctermfg=Yellow guifg=#E9967A " DarkSalmon
"highlight zenlibFunc ctermfg=Yellow guifg=#F08080 " LightCoral
highlight zenlibFunc ctermfg=Yellow guifg=#FF6347 gui=NONE " Tomato

syntax match zenlibFunc2 /\<zlog_\w*\>/

highlight zenlibFunc2 ctermfg=Yellow guifg=#828282 " Charcoal Gray

"
" constant
"
syntax keyword zenlibConst RBKP_KEY
syntax match zenlibConst /\<ZERR_\w*\>/
syntax match zenlibConst /\<SLIST_\w*\>/
syntax match zenlibConst /\<DLIST_\w*\>/
syntax match zenlibConst /\<SKL_\w*\>/
syntax match zenlibConst /\<SKLIST_\w*\>/

"highlight zenlibConst ctermfg=Yellow guifg=#F08C00 gui=bold " Amber
highlight zenlibConst ctermfg=Yellow guifg=#FF6347 gui=italic " Tomato


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" syscall
"

syntax keyword linuxSyscall syscall read write open close stat fstat lstat poll lseek mmap mprotect munmap brk rt_sigaction rt_sigprocmask ioctl pread64 pwrite64 readv writev access pipe select sched_yield mremap msync mincore madvise shmget shmat shmctl dup dup2 nanosleep getitimer setitimer alarm getpid sendfile socket connect accept sendto recvfrom sendmsg recvmsg shutdown bind listen getsockname getpeername socketpair setsockopt getsockopt clone fork vfork execve exit wait4 kill uname semget semop semctl shmdt msgget msgsnd msgrcv msgctl fcntl flock fsync fdatasync truncate ftruncate getcwd chdir fchdir rename mkdir rmdir creat link unlink symlink readlink chmod fchmod chown fchown lchown umask gettimeofday getrlimit getrusage sysinfo times ptrace getuid getgid setuid setgid geteuid getegid setreuid setregid getgroups setgroups setresuid setresgid getresuid getresgid sigaltstack sigsuspend sigpending sigprocmask sigreturn sigaction sched_setparam sched_getparam sched_setscheduler sched_getscheduler sched_get_priority_max sched_get_priority_min sched_rr_get_interval nanosleep getpriority setpriority reboot chroot sync mount umount2 swapon swapoff sethostname setdomainname syslog init_module delete_module gettid futex epoll_create epoll_ctl epoll_wait eventfd timerfd_create timerfd_settime timerfd_gettime signalfd eventfd_read eventfd_write clock_gettime clock_settime clock_getres clock_nanosleep tgkill tkill tgkill rt_sigqueueinfo rt_tgsigqueueinfo getrandom perf_event_open openat mkdirat mknodat fchownat fchmodat faccessat fstatat unlinkat renameat linkat symlinkat readlinkat utimensat ppoll pselect splice tee vmsplice inotify_init inotify_add_watch inotify_rm_watch fanotify_init fanotify_mark name_to_handle_at open_by_handle_at setns pidfd_open pidfd_send_signal clone3 close_range io_uring_setup io_uring_enter io_uring_register

"highlight linuxSyscall ctermfg=Yellow guifg=#9DC8B0 
"highlight linuxSyscall ctermfg=Yellow guifg=#C4ADCF
"highlight linuxSyscall ctermfg=Yellow guifg=#A8D8EA 
"highlight linuxSyscall ctermfg=Yellow guifg=#B39DFB " Bright Lavender
"highlight linuxSyscall ctermfg=Yellow guifg=#7C83BC " Lavender Blue
"highlight linuxSyscall ctermfg=Yellow guifg=#C9A87C " Clay
"highlight linuxSyscall ctermfg=Yellow guifg=#B6A6CA " Grayish Lavender
"highlight linuxSyscall ctermfg=Yellow guifg=#D4B483 " Sand Beige
"highlight linuxSyscall ctermfg=Yellow guifg=#7EB09B " Olive Green
"highlight linuxSyscall ctermfg=Yellow guifg=#FFAA00 " Chrome Yellow
"highlight linuxSyscall ctermfg=Yellow guifg=#FF69B4 " 
"highlight linuxSyscall ctermfg=Yellow guifg=#DB4E9C " 
"highlight linuxSyscall ctermfg=Yellow guifg=#E2A6B4 " 
"highlight linuxSyscall ctermfg=Yellow guifg=#FA8EE5 " 
highlight linuxSyscall ctermfg=Yellow guifg=#A020F0 gui=NONE " Purple

"
" constant
"
syntax keyword linuxSyscallConst O_RDONLY O_WRONLY O_RDWR O_CREAT O_EXCL O_TRUNC O_APPEND O_NONBLOCK O_SYNC O_DSYNC O_CLOEXEC S_IRUSR S_IWUSR S_IXUSR S_IRGRP S_IWGRP S_IXGRP S_IROTH S_IWOTH S_IXOTH S_ISUID S_ISGID S_ISVTX S_IFREG S_IFDIR S_IFLNK S_IFCHR S_IFBLK S_IFIFO S_IFSOCK PROT_READ PROT_WRITE PROT_EXEC PROT_NONE MAP_SHARED MAP_PRIVATE MAP_ANONYMOUS MAP_FIXED MAP_POPULATE MADV_NORMAL MADV_RANDOM MADV_SEQUENTIAL MADV_WILLNEED MADV_DONTNEED MCL_CURRENT MCL_FUTURE SEEK_SET SEEK_CUR SEEK_END F_GETFD F_SETFD F_GETFL F_SETFL F_DUPFD FD_CLOEXEC EPOLLIN EPOLLOUT EPOLLERR EPOLLHUP EPOLLRDHUP EPOLLET EPOLLONESHOT EPOLLPRI POLLIN POLLOUT POLLERR POLLHUP POLLPRI POLLNVAL POLLRDNORM POLLRDBAND POLLWRNORM POLLWRBAND AF_UNIX AF_INET AF_INET6 SOCK_STREAM SOCK_DGRAM SOCK_RAW SOCK_SEQPACKET SOL_SOCKET SO_REUSEADDR SO_REUSEPORT SO_BROADCAST SO_LINGER SO_RCVBUF SO_SNDBUF SO_KEEPALIVE SO_OOBINLINE IPPROTO_TCP IPPROTO_UDP IPPROTO_IP IPPROTO_ICMP IPPROTO_IPV6 TCP_NODELAY TCP_MAXSEG TCP_KEEPIDLE TCP_KEEPINTVL TCP_KEEPCNT SHM_RDONLY SHM_RND IPC_CREAT IPC_EXCL IPC_NOWAIT IPC_PRIVATE CLONE_VM CLONE_FS CLONE_FILES CLONE_SIGHAND CLONE_THREAD CLONE_PARENT SIGCHLD SIGINT SIGTERM SIGKILL SIGUSR1 SIGUSR2 SIGSTOP SIGCONT SIGPIPE SIGALRM SIGSEGV SIGBUS EINVAL EACCES ENOENT ENOMEM EEXIST EIO EBADF EFAULT EBUSY EPIPE ESRCH EISDIR ENOTDIR ENOSPC ENOSYS 

highlight linuxSyscallConst ctermfg=Yellow guifg=#A020F0 gui=italic " Purple

" hi SystemCall     guifg=#9DC8B0 gui=bold    " Sage Green
" hi UserFunction   guifg=#C4ADCF gui=bold    " Lavender Purple  
" hi GlibcConst  guifg=#A8D8EA gui=italic  " Pastel Blue
" hi UserConst   guifg=#D4B483 gui=bold    " Sand Beige
" 
" hi SystemCall     guifg=#7C83BC gui=bold    " Lavender Blue
" hi UserFunction   guifg=#7EB09B gui=bold    " Olive Green
" hi GlibcConst  guifg=#B6A6CA gui=italic  " Grayish Lavender  
" hi UserConst   guifg=#C9A87C gui=bold    " Clay

" " Elegant Pastel Blues
" hi Color1 guifg=#A8D8EA gui=bold    " Sky Pastel
" hi Color2 guifg=#7C83BC gui=bold    " Light Lavender Blue
" hi Color3 guifg=#88BEDC gui=bold    " Refreshing Pastel
" hi Color4 guifg=#6A8CAF gui=bold    " Calm Blue
" 
" " Natural Green Tones
" hi Color1 guifg=#9DC8B0 gui=bold    " Sage Green
" hi Color2 guifg=#B8D8C0 gui=bold    " Mint Sage  
" hi Color3 guifg=#7EB09B gui=bold    " Olive Green
" hi Color4 guifg=#A5C9A1 gui=bold    " Apple Green
" 
" " Soft Purple Tones
" hi Color1 guifg=#C4ADCF gui=bold    " Light Lavender
" hi Color2 guifg=#B6A6CA gui=bold    " Grayish Lavender
" hi Color3 guifg=#D8BFD8 gui=bold    " Thistle Purple
" hi Color4 guifg=#A98CB2 gui=bold    " Dusty Purple
" 
" " Elegant Grayish Tones
" hi Color1 guifg=#BBBBBB gui=bold    " Warm Gray
" hi Color2 guifg=#A8A8A8 gui=bold    " Medium Gray
" hi Color3 guifg=#959595 gui=bold    " Dim Gray
" hi Color4 guifg=#828282 gui=bold    " Charcoal Gray
" 
" " Warm and Calm Earth Tones
" hi Color1 guifg=#D4B483 gui=bold    " Sand Beige
" hi Color2 guifg=#C9A87C gui=bold    " Clay
" hi Color3 guifg=#BC987E gui=bold    " Terracotta
" hi Color4 guifg=#AF886B gui=bold    " Camel
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" glibc
"

"
" function
"
syntax keyword glibcFunc printf fprintf sprintf snprintf vprintf vfprintf vsprintf vsnprintf vsyslog getchar getchar_unlocked putchar putchar_unlocked puts fputs fgets fread fwrite strcpy strncpy strcat strncat strcmp strncmp strlen strchr strrchr strstr strtok strdup strnlen malloc calloc realloc free memchr memcmp memcpy memmove memset memalign posix_memalign perror strerror strerror_r assert abort raise signal psignal time clock gettimeofday localtime gmtime mktime strftime difftime tzset abs labs llabs div ldiv lldiv rand srand drand48 lrand48 srand48 sqrt pow sin cos tan asin acos atan atan2 log log10 exp ceil floor fabs fmod trunc round exit _exit atexit quick_exit _Exit getenv setenv putenv unsetenv system getpid getppid getuid geteuid getgid getegid getcwd chdir sleep usleep fork execve execvp execv execl execlp wait waitpid waitid fopen fclose fopen64 freopen feof ferror clearerr fread fwrite fseek ftell rewind fflush remove rename tmpfile tmpnam fgetc fputc ungetc fscanf fprintf fscanf sscanf vscanf vfscanf vsscanf open close read write lseek access stat fstat lstat mkdir rmdir unlink chmod chown truncate opendir readdir closedir rewinddir telldir seekdir scandir alphasort strerror strerror_r strerror_l qsort bsearch atoi atol atof strtol strtoul strtoll strtoull basename dirname realpath canonicalize_file_name isalpha isdigit isspace isupper islower isalnum ispunct isprint toupper tolower printf fprintf snprintf vsnprintf perror fflush abort localeconv setlocale strerror assert gethostname sethostname va_start va_arg va_end va_copy
syntax match glibcFunc /\<pthread_\w*\>/

"highlight glibcFunc ctermfg=Cyan guifg=#00FFFF   " Cyan
"highlight glibcFunc ctermfg=Yellow guifg=#9932CC " darkorchid
"highlight glibcFunc ctermfg=Yellow guifg=#8A2BE2 " blueviolet
highlight glibcFunc ctermfg=Yellow guifg=#FF1493 gui=NONE " deeppink

"
" constant
"
syntax keyword glibcConst NULL EOF EXIT_SUCCESS EXIT_FAILURE RAND_MAX MB_CUR_MAX SIGINT SIGTERM SIGKILL SIGABRT SIGSEGV SIGBUS SIGPIPE SIGCHLD SIGHUP SIGUSR1 SIGUSR2 SIGSTOP SIGCONT EINVAL EACCES ENOENT ENOMEM EEXIST EIO EBADF EFAULT EBUSY EPIPE ESRCH EISDIR ENOTDIR ENOSPC ENOSYS SEEK_SET SEEK_CUR SEEK_END CLOCKS_PER_SEC CHAR_BIT CHAR_MIN CHAR_MAX SCHAR_MIN SCHAR_MAX UCHAR_MAX SHRT_MIN SHRT_MAX USHRT_MAX INT_MIN INT_MAX UINT_MAX LONG_MIN LONG_MAX ULONG_MAX LLONG_MIN LLONG_MAX ULLONG_MAX HUGE_VAL INFINITY NAN LC_ALL LC_NUMERIC LC_TIME LC_MONETARY LC_MESSAGES LC_COLLATE LC_CTYPE LC_NAME LC_PAPER LC_TELEPHONE LC_ADDRESS PATH_MAX NAME_MAX TMP_MAX FOPEN_MAX BUFSIZ errno
syntax match glibcConst /\<FD_\w*\>/

"highlight glibcConst ctermfg=Yellow guifg=#A78BFA " Medium Lavender
highlight glibcConst ctermfg=Yellow guifg=#FF1493 gui=italic " deeppink

