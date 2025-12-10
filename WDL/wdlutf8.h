#ifndef _WDLUTF8_H_
#define _WDLUTF8_H_

#ifndef WDL_UTF8_MAXFNLEN
#define WDL_UTF8_MAXFNLEN 2048
#endif

// WDL_DetectUTF8 - checks if a string contains UTF-8 sequences
// Returns: 1 if UTF-8 detected, 0 otherwise
static int WDL_DetectUTF8(const char *str)
{
  if (!str) return 0;
  const unsigned char *p = (const unsigned char *)str;
  while (*p)
  {
    unsigned char c = *p;
    if (c >= 0x80)
    {
      // Check for valid UTF-8 sequences
      if ((c & 0xE0) == 0xC0 && (p[1] & 0xC0) == 0x80)
        return 1; // 2-byte sequence
      if ((c & 0xF0) == 0xE0 && (p[1] & 0xC0) == 0x80 && (p[2] & 0xC0) == 0x80)
        return 1; // 3-byte sequence
      if ((c & 0xF8) == 0xF0 && (p[1] & 0xC0) == 0x80 && (p[2] & 0xC0) == 0x80 && (p[3] & 0xC0) == 0x80)
        return 1; // 4-byte sequence
    }
    p++;
  }
  return 0;
}

#endif
