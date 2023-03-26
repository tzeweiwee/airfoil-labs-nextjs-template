---
to: src/pages/api/supabase/index.ts
---
// Write a nextjs api handler to forward request to another url

import { SUPABASE_API_KEY } from "@/common/constants";

const handler = async (req, res) => {
  const { url, ...rest } = req.query;
  const { method } = req;
  const options = {
    method,
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${SUPABASE_API_KEY}`,
      apikey: SUPABASE_API_KEY,
    },
  };
  if (req.method !== "GET") {
    options["body"] = JSON.stringify(req.body);
  }
  const response = await fetch(url, options);

  try {
    const data = await response.json();
    return res.status(response.status).json(data);
  } catch (error) {
    console.error(error);
    return res.status(response.status).end();
  }
};

export default handler;
