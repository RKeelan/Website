// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://www.rkeelan.com',
  output: 'static',
  trailingSlash: 'never',
  build: {
    format: 'file' // This ensures URLs like /stories.html instead of /stories/
  }
});
