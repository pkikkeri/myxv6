
_hello3:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 10             	sub    $0x10,%esp
	
	trace("test_2.txt");
  11:	68 08 07 00 00       	push   $0x708
  16:	e8 00 03 00 00       	call   31b <trace>
	exit();
  1b:	e8 53 02 00 00       	call   273 <exit>

00000020 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  20:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  21:	31 c0                	xor    %eax,%eax
{
  23:	89 e5                	mov    %esp,%ebp
  25:	53                   	push   %ebx
  26:	8b 4d 08             	mov    0x8(%ebp),%ecx
  29:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  30:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  34:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  37:	83 c0 01             	add    $0x1,%eax
  3a:	84 d2                	test   %dl,%dl
  3c:	75 f2                	jne    30 <strcpy+0x10>
    ;
  return os;
}
  3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  41:	89 c8                	mov    %ecx,%eax
  43:	c9                   	leave  
  44:	c3                   	ret    
  45:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000050 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  54:	8b 55 08             	mov    0x8(%ebp),%edx
  57:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  5a:	0f b6 02             	movzbl (%edx),%eax
  5d:	84 c0                	test   %al,%al
  5f:	75 17                	jne    78 <strcmp+0x28>
  61:	eb 3a                	jmp    9d <strcmp+0x4d>
  63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  67:	90                   	nop
  68:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  6c:	83 c2 01             	add    $0x1,%edx
  6f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  72:	84 c0                	test   %al,%al
  74:	74 1a                	je     90 <strcmp+0x40>
    p++, q++;
  76:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  78:	0f b6 19             	movzbl (%ecx),%ebx
  7b:	38 c3                	cmp    %al,%bl
  7d:	74 e9                	je     68 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  7f:	29 d8                	sub    %ebx,%eax
}
  81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  84:	c9                   	leave  
  85:	c3                   	ret    
  86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  90:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  94:	31 c0                	xor    %eax,%eax
  96:	29 d8                	sub    %ebx,%eax
}
  98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  9b:	c9                   	leave  
  9c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  9d:	0f b6 19             	movzbl (%ecx),%ebx
  a0:	31 c0                	xor    %eax,%eax
  a2:	eb db                	jmp    7f <strcmp+0x2f>
  a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  af:	90                   	nop

000000b0 <strlen>:

uint
strlen(const char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  b6:	80 3a 00             	cmpb   $0x0,(%edx)
  b9:	74 15                	je     d0 <strlen+0x20>
  bb:	31 c0                	xor    %eax,%eax
  bd:	8d 76 00             	lea    0x0(%esi),%esi
  c0:	83 c0 01             	add    $0x1,%eax
  c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  c7:	89 c1                	mov    %eax,%ecx
  c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
  cb:	89 c8                	mov    %ecx,%eax
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    
  cf:	90                   	nop
  for(n = 0; s[n]; n++)
  d0:	31 c9                	xor    %ecx,%ecx
}
  d2:	5d                   	pop    %ebp
  d3:	89 c8                	mov    %ecx,%eax
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  f5:	89 d0                	mov    %edx,%eax
  f7:	c9                   	leave  
  f8:	c3                   	ret    
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	75 12                	jne    123 <strchr+0x23>
 111:	eb 1d                	jmp    130 <strchr+0x30>
 113:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 117:	90                   	nop
 118:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 11c:	83 c0 01             	add    $0x1,%eax
 11f:	84 d2                	test   %dl,%dl
 121:	74 0d                	je     130 <strchr+0x30>
    if(*s == c)
 123:	38 d1                	cmp    %dl,%cl
 125:	75 f1                	jne    118 <strchr+0x18>
      return (char*)s;
  return 0;
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 130:	31 c0                	xor    %eax,%eax
}
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 13b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 13f:	90                   	nop

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 145:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 148:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 149:	31 db                	xor    %ebx,%ebx
{
 14b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 14e:	eb 27                	jmp    177 <gets+0x37>
    cc = read(0, &c, 1);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	6a 01                	push   $0x1
 155:	57                   	push   %edi
 156:	6a 00                	push   $0x0
 158:	e8 2e 01 00 00       	call   28b <read>
    if(cc < 1)
 15d:	83 c4 10             	add    $0x10,%esp
 160:	85 c0                	test   %eax,%eax
 162:	7e 1d                	jle    181 <gets+0x41>
      break;
    buf[i++] = c;
 164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 168:	8b 55 08             	mov    0x8(%ebp),%edx
 16b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 16f:	3c 0a                	cmp    $0xa,%al
 171:	74 1d                	je     190 <gets+0x50>
 173:	3c 0d                	cmp    $0xd,%al
 175:	74 19                	je     190 <gets+0x50>
  for(i=0; i+1 < max; ){
 177:	89 de                	mov    %ebx,%esi
 179:	83 c3 01             	add    $0x1,%ebx
 17c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 17f:	7c cf                	jl     150 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 188:	8d 65 f4             	lea    -0xc(%ebp),%esp
 18b:	5b                   	pop    %ebx
 18c:	5e                   	pop    %esi
 18d:	5f                   	pop    %edi
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    
  buf[i] = '\0';
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	89 de                	mov    %ebx,%esi
 195:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 199:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19c:	5b                   	pop    %ebx
 19d:	5e                   	pop    %esi
 19e:	5f                   	pop    %edi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
 1a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	56                   	push   %esi
 1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b5:	83 ec 08             	sub    $0x8,%esp
 1b8:	6a 00                	push   $0x0
 1ba:	ff 75 08             	push   0x8(%ebp)
 1bd:	e8 f1 00 00 00       	call   2b3 <open>
  if(fd < 0)
 1c2:	83 c4 10             	add    $0x10,%esp
 1c5:	85 c0                	test   %eax,%eax
 1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1c9:	83 ec 08             	sub    $0x8,%esp
 1cc:	ff 75 0c             	push   0xc(%ebp)
 1cf:	89 c3                	mov    %eax,%ebx
 1d1:	50                   	push   %eax
 1d2:	e8 f4 00 00 00       	call   2cb <fstat>
  close(fd);
 1d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1da:	89 c6                	mov    %eax,%esi
  close(fd);
 1dc:	e8 ba 00 00 00       	call   29b <close>
  return r;
 1e1:	83 c4 10             	add    $0x10,%esp
}
 1e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e7:	89 f0                	mov    %esi,%eax
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f5:	eb ed                	jmp    1e4 <stat+0x34>
 1f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fe:	66 90                	xchg   %ax,%ax

00000200 <atoi>:

int
atoi(const char *s)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	53                   	push   %ebx
 204:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 207:	0f be 02             	movsbl (%edx),%eax
 20a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 20d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 210:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 215:	77 1e                	ja     235 <atoi+0x35>
 217:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 220:	83 c2 01             	add    $0x1,%edx
 223:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 226:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 22a:	0f be 02             	movsbl (%edx),%eax
 22d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 230:	80 fb 09             	cmp    $0x9,%bl
 233:	76 eb                	jbe    220 <atoi+0x20>
  return n;
}
 235:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 238:	89 c8                	mov    %ecx,%eax
 23a:	c9                   	leave  
 23b:	c3                   	ret    
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 45 10             	mov    0x10(%ebp),%eax
 247:	8b 55 08             	mov    0x8(%ebp),%edx
 24a:	56                   	push   %esi
 24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 24e:	85 c0                	test   %eax,%eax
 250:	7e 13                	jle    265 <memmove+0x25>
 252:	01 d0                	add    %edx,%eax
  dst = vdst;
 254:	89 d7                	mov    %edx,%edi
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 260:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 261:	39 f8                	cmp    %edi,%eax
 263:	75 fb                	jne    260 <memmove+0x20>
  return vdst;
}
 265:	5e                   	pop    %esi
 266:	89 d0                	mov    %edx,%eax
 268:	5f                   	pop    %edi
 269:	5d                   	pop    %ebp
 26a:	c3                   	ret    

0000026b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <exit>:
SYSCALL(exit)
 273:	b8 02 00 00 00       	mov    $0x2,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <wait>:
SYSCALL(wait)
 27b:	b8 03 00 00 00       	mov    $0x3,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <pipe>:
SYSCALL(pipe)
 283:	b8 04 00 00 00       	mov    $0x4,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <read>:
SYSCALL(read)
 28b:	b8 05 00 00 00       	mov    $0x5,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <write>:
SYSCALL(write)
 293:	b8 10 00 00 00       	mov    $0x10,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <close>:
SYSCALL(close)
 29b:	b8 15 00 00 00       	mov    $0x15,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <kill>:
SYSCALL(kill)
 2a3:	b8 06 00 00 00       	mov    $0x6,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <exec>:
SYSCALL(exec)
 2ab:	b8 07 00 00 00       	mov    $0x7,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <open>:
SYSCALL(open)
 2b3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <mknod>:
SYSCALL(mknod)
 2bb:	b8 11 00 00 00       	mov    $0x11,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <unlink>:
SYSCALL(unlink)
 2c3:	b8 12 00 00 00       	mov    $0x12,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <fstat>:
SYSCALL(fstat)
 2cb:	b8 08 00 00 00       	mov    $0x8,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <link>:
SYSCALL(link)
 2d3:	b8 13 00 00 00       	mov    $0x13,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <mkdir>:
SYSCALL(mkdir)
 2db:	b8 14 00 00 00       	mov    $0x14,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <chdir>:
SYSCALL(chdir)
 2e3:	b8 09 00 00 00       	mov    $0x9,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <dup>:
SYSCALL(dup)
 2eb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <getpid>:
SYSCALL(getpid)
 2f3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <sbrk>:
SYSCALL(sbrk)
 2fb:	b8 0c 00 00 00       	mov    $0xc,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <sleep>:
SYSCALL(sleep)
 303:	b8 0d 00 00 00       	mov    $0xd,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <uptime>:
SYSCALL(uptime)
 30b:	b8 0e 00 00 00       	mov    $0xe,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <getcount>:
SYSCALL(getcount)
 313:	b8 16 00 00 00       	mov    $0x16,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <trace>:
SYSCALL(trace)
 31b:	b8 17 00 00 00       	mov    $0x17,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    
 323:	66 90                	xchg   %ax,%ax
 325:	66 90                	xchg   %ax,%ax
 327:	66 90                	xchg   %ax,%ax
 329:	66 90                	xchg   %ax,%ax
 32b:	66 90                	xchg   %ax,%ax
 32d:	66 90                	xchg   %ax,%ax
 32f:	90                   	nop

00000330 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	57                   	push   %edi
 334:	56                   	push   %esi
 335:	53                   	push   %ebx
 336:	83 ec 3c             	sub    $0x3c,%esp
 339:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 33c:	89 d1                	mov    %edx,%ecx
{
 33e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 341:	85 d2                	test   %edx,%edx
 343:	0f 89 7f 00 00 00    	jns    3c8 <printint+0x98>
 349:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 34d:	74 79                	je     3c8 <printint+0x98>
    neg = 1;
 34f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 356:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 358:	31 db                	xor    %ebx,%ebx
 35a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 360:	89 c8                	mov    %ecx,%eax
 362:	31 d2                	xor    %edx,%edx
 364:	89 cf                	mov    %ecx,%edi
 366:	f7 75 c4             	divl   -0x3c(%ebp)
 369:	0f b6 92 74 07 00 00 	movzbl 0x774(%edx),%edx
 370:	89 45 c0             	mov    %eax,-0x40(%ebp)
 373:	89 d8                	mov    %ebx,%eax
 375:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 378:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 37b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 37e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 381:	76 dd                	jbe    360 <printint+0x30>
  if(neg)
 383:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 386:	85 c9                	test   %ecx,%ecx
 388:	74 0c                	je     396 <printint+0x66>
    buf[i++] = '-';
 38a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 38f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 391:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 396:	8b 7d b8             	mov    -0x48(%ebp),%edi
 399:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 39d:	eb 07                	jmp    3a6 <printint+0x76>
 39f:	90                   	nop
    putc(fd, buf[i]);
 3a0:	0f b6 13             	movzbl (%ebx),%edx
 3a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 3a6:	83 ec 04             	sub    $0x4,%esp
 3a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 3ac:	6a 01                	push   $0x1
 3ae:	56                   	push   %esi
 3af:	57                   	push   %edi
 3b0:	e8 de fe ff ff       	call   293 <write>
  while(--i >= 0)
 3b5:	83 c4 10             	add    $0x10,%esp
 3b8:	39 de                	cmp    %ebx,%esi
 3ba:	75 e4                	jne    3a0 <printint+0x70>
}
 3bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3bf:	5b                   	pop    %ebx
 3c0:	5e                   	pop    %esi
 3c1:	5f                   	pop    %edi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 3cf:	eb 87                	jmp    358 <printint+0x28>
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3df:	90                   	nop

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 3ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 3ef:	0f b6 13             	movzbl (%ebx),%edx
 3f2:	84 d2                	test   %dl,%dl
 3f4:	74 6a                	je     460 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 3f6:	8d 45 10             	lea    0x10(%ebp),%eax
 3f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 3fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 3ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 401:	89 45 d0             	mov    %eax,-0x30(%ebp)
 404:	eb 36                	jmp    43c <printf+0x5c>
 406:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 413:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 418:	83 f8 25             	cmp    $0x25,%eax
 41b:	74 15                	je     432 <printf+0x52>
  write(fd, &c, 1);
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	88 55 e7             	mov    %dl,-0x19(%ebp)
 423:	6a 01                	push   $0x1
 425:	57                   	push   %edi
 426:	56                   	push   %esi
 427:	e8 67 fe ff ff       	call   293 <write>
 42c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 42f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 432:	0f b6 13             	movzbl (%ebx),%edx
 435:	83 c3 01             	add    $0x1,%ebx
 438:	84 d2                	test   %dl,%dl
 43a:	74 24                	je     460 <printf+0x80>
    c = fmt[i] & 0xff;
 43c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 43f:	85 c9                	test   %ecx,%ecx
 441:	74 cd                	je     410 <printf+0x30>
      }
    } else if(state == '%'){
 443:	83 f9 25             	cmp    $0x25,%ecx
 446:	75 ea                	jne    432 <printf+0x52>
      if(c == 'd'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	0f 84 07 01 00 00    	je     558 <printf+0x178>
 451:	83 e8 63             	sub    $0x63,%eax
 454:	83 f8 15             	cmp    $0x15,%eax
 457:	77 17                	ja     470 <printf+0x90>
 459:	ff 24 85 1c 07 00 00 	jmp    *0x71c(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 460:	8d 65 f4             	lea    -0xc(%ebp),%esp
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5f                   	pop    %edi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    
 468:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46f:	90                   	nop
  write(fd, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 476:	6a 01                	push   $0x1
 478:	57                   	push   %edi
 479:	56                   	push   %esi
 47a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 47e:	e8 10 fe ff ff       	call   293 <write>
        putc(fd, c);
 483:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 487:	83 c4 0c             	add    $0xc,%esp
 48a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 48d:	6a 01                	push   $0x1
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	e8 fd fd ff ff       	call   293 <write>
        putc(fd, c);
 496:	83 c4 10             	add    $0x10,%esp
      state = 0;
 499:	31 c9                	xor    %ecx,%ecx
 49b:	eb 95                	jmp    432 <printf+0x52>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4a0:	83 ec 0c             	sub    $0xc,%esp
 4a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a8:	6a 00                	push   $0x0
 4aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4ad:	8b 10                	mov    (%eax),%edx
 4af:	89 f0                	mov    %esi,%eax
 4b1:	e8 7a fe ff ff       	call   330 <printint>
        ap++;
 4b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 4ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bd:	31 c9                	xor    %ecx,%ecx
 4bf:	e9 6e ff ff ff       	jmp    432 <printf+0x52>
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4cb:	8b 10                	mov    (%eax),%edx
        ap++;
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4d3:	85 d2                	test   %edx,%edx
 4d5:	0f 84 8d 00 00 00    	je     568 <printf+0x188>
        while(*s != 0){
 4db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 4de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 4e0:	84 c0                	test   %al,%al
 4e2:	0f 84 4a ff ff ff    	je     432 <printf+0x52>
 4e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 4eb:	89 d3                	mov    %edx,%ebx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 4f3:	83 c3 01             	add    $0x1,%ebx
 4f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 4f9:	6a 01                	push   $0x1
 4fb:	57                   	push   %edi
 4fc:	56                   	push   %esi
 4fd:	e8 91 fd ff ff       	call   293 <write>
        while(*s != 0){
 502:	0f b6 03             	movzbl (%ebx),%eax
 505:	83 c4 10             	add    $0x10,%esp
 508:	84 c0                	test   %al,%al
 50a:	75 e4                	jne    4f0 <printf+0x110>
      state = 0;
 50c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 50f:	31 c9                	xor    %ecx,%ecx
 511:	e9 1c ff ff ff       	jmp    432 <printf+0x52>
 516:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	b9 0a 00 00 00       	mov    $0xa,%ecx
 528:	6a 01                	push   $0x1
 52a:	e9 7b ff ff ff       	jmp    4aa <printf+0xca>
 52f:	90                   	nop
        putc(fd, *ap);
 530:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 533:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 536:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 538:	6a 01                	push   $0x1
 53a:	57                   	push   %edi
 53b:	56                   	push   %esi
        putc(fd, *ap);
 53c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 53f:	e8 4f fd ff ff       	call   293 <write>
        ap++;
 544:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 548:	83 c4 10             	add    $0x10,%esp
      state = 0;
 54b:	31 c9                	xor    %ecx,%ecx
 54d:	e9 e0 fe ff ff       	jmp    432 <printf+0x52>
 552:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 558:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 55b:	83 ec 04             	sub    $0x4,%esp
 55e:	e9 2a ff ff ff       	jmp    48d <printf+0xad>
 563:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 567:	90                   	nop
          s = "(null)";
 568:	ba 13 07 00 00       	mov    $0x713,%edx
        while(*s != 0){
 56d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 570:	b8 28 00 00 00       	mov    $0x28,%eax
 575:	89 d3                	mov    %edx,%ebx
 577:	e9 74 ff ff ff       	jmp    4f0 <printf+0x110>
 57c:	66 90                	xchg   %ax,%ax
 57e:	66 90                	xchg   %ax,%ax

00000580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 580:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 581:	a1 1c 0a 00 00       	mov    0xa1c,%eax
{
 586:	89 e5                	mov    %esp,%ebp
 588:	57                   	push   %edi
 589:	56                   	push   %esi
 58a:	53                   	push   %ebx
 58b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 58e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 598:	89 c2                	mov    %eax,%edx
 59a:	8b 00                	mov    (%eax),%eax
 59c:	39 ca                	cmp    %ecx,%edx
 59e:	73 30                	jae    5d0 <free+0x50>
 5a0:	39 c1                	cmp    %eax,%ecx
 5a2:	72 04                	jb     5a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5a4:	39 c2                	cmp    %eax,%edx
 5a6:	72 f0                	jb     598 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ae:	39 f8                	cmp    %edi,%eax
 5b0:	74 30                	je     5e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5b5:	8b 42 04             	mov    0x4(%edx),%eax
 5b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5bb:	39 f1                	cmp    %esi,%ecx
 5bd:	74 3a                	je     5f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5c1:	5b                   	pop    %ebx
  freep = p;
 5c2:	89 15 1c 0a 00 00    	mov    %edx,0xa1c
}
 5c8:	5e                   	pop    %esi
 5c9:	5f                   	pop    %edi
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d0:	39 c2                	cmp    %eax,%edx
 5d2:	72 c4                	jb     598 <free+0x18>
 5d4:	39 c1                	cmp    %eax,%ecx
 5d6:	73 c0                	jae    598 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 5d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5de:	39 f8                	cmp    %edi,%eax
 5e0:	75 d0                	jne    5b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 5e2:	03 70 04             	add    0x4(%eax),%esi
 5e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5e8:	8b 02                	mov    (%edx),%eax
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 5ef:	8b 42 04             	mov    0x4(%edx),%eax
 5f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5f5:	39 f1                	cmp    %esi,%ecx
 5f7:	75 c6                	jne    5bf <free+0x3f>
    p->s.size += bp->s.size;
 5f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 5fc:	89 15 1c 0a 00 00    	mov    %edx,0xa1c
    p->s.size += bp->s.size;
 602:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 605:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 608:	89 0a                	mov    %ecx,(%edx)
}
 60a:	5b                   	pop    %ebx
 60b:	5e                   	pop    %esi
 60c:	5f                   	pop    %edi
 60d:	5d                   	pop    %ebp
 60e:	c3                   	ret    
 60f:	90                   	nop

00000610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	57                   	push   %edi
 614:	56                   	push   %esi
 615:	53                   	push   %ebx
 616:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 619:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 61c:	8b 3d 1c 0a 00 00    	mov    0xa1c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 622:	8d 70 07             	lea    0x7(%eax),%esi
 625:	c1 ee 03             	shr    $0x3,%esi
 628:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 62b:	85 ff                	test   %edi,%edi
 62d:	0f 84 9d 00 00 00    	je     6d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 633:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 635:	8b 4a 04             	mov    0x4(%edx),%ecx
 638:	39 f1                	cmp    %esi,%ecx
 63a:	73 6a                	jae    6a6 <malloc+0x96>
 63c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 641:	39 de                	cmp    %ebx,%esi
 643:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 646:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 64d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 650:	eb 17                	jmp    669 <malloc+0x59>
 652:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 658:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 65a:	8b 48 04             	mov    0x4(%eax),%ecx
 65d:	39 f1                	cmp    %esi,%ecx
 65f:	73 4f                	jae    6b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 661:	8b 3d 1c 0a 00 00    	mov    0xa1c,%edi
 667:	89 c2                	mov    %eax,%edx
 669:	39 d7                	cmp    %edx,%edi
 66b:	75 eb                	jne    658 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 66d:	83 ec 0c             	sub    $0xc,%esp
 670:	ff 75 e4             	push   -0x1c(%ebp)
 673:	e8 83 fc ff ff       	call   2fb <sbrk>
  if(p == (char*)-1)
 678:	83 c4 10             	add    $0x10,%esp
 67b:	83 f8 ff             	cmp    $0xffffffff,%eax
 67e:	74 1c                	je     69c <malloc+0x8c>
  hp->s.size = nu;
 680:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	83 c0 08             	add    $0x8,%eax
 689:	50                   	push   %eax
 68a:	e8 f1 fe ff ff       	call   580 <free>
  return freep;
 68f:	8b 15 1c 0a 00 00    	mov    0xa1c,%edx
      if((p = morecore(nunits)) == 0)
 695:	83 c4 10             	add    $0x10,%esp
 698:	85 d2                	test   %edx,%edx
 69a:	75 bc                	jne    658 <malloc+0x48>
        return 0;
  }
}
 69c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 69f:	31 c0                	xor    %eax,%eax
}
 6a1:	5b                   	pop    %ebx
 6a2:	5e                   	pop    %esi
 6a3:	5f                   	pop    %edi
 6a4:	5d                   	pop    %ebp
 6a5:	c3                   	ret    
    if(p->s.size >= nunits){
 6a6:	89 d0                	mov    %edx,%eax
 6a8:	89 fa                	mov    %edi,%edx
 6aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6b0:	39 ce                	cmp    %ecx,%esi
 6b2:	74 4c                	je     700 <malloc+0xf0>
        p->s.size -= nunits;
 6b4:	29 f1                	sub    %esi,%ecx
 6b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 6bf:	89 15 1c 0a 00 00    	mov    %edx,0xa1c
}
 6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6c8:	83 c0 08             	add    $0x8,%eax
}
 6cb:	5b                   	pop    %ebx
 6cc:	5e                   	pop    %esi
 6cd:	5f                   	pop    %edi
 6ce:	5d                   	pop    %ebp
 6cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 6d0:	c7 05 1c 0a 00 00 20 	movl   $0xa20,0xa1c
 6d7:	0a 00 00 
    base.s.size = 0;
 6da:	bf 20 0a 00 00       	mov    $0xa20,%edi
    base.s.ptr = freep = prevp = &base;
 6df:	c7 05 20 0a 00 00 20 	movl   $0xa20,0xa20
 6e6:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 6eb:	c7 05 24 0a 00 00 00 	movl   $0x0,0xa24
 6f2:	00 00 00 
    if(p->s.size >= nunits){
 6f5:	e9 42 ff ff ff       	jmp    63c <malloc+0x2c>
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb b9                	jmp    6bf <malloc+0xaf>
