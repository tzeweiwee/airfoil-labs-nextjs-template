---
to: src/pages/api/auth/[...nextauth].ts
---
import NextAuth from 'next-auth';

import { authOptions } from '@/server/auth';

export default NextAuth(authOptions);