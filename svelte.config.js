import adapter from '@sveltejs/adapter-static';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			pages: 'build',
			assets: 'build',
			fallback: '404.html',
			precompress: false,
			strict: true
		}),
		paths: {
			// Uncomment and set to your repo name if deploying to username.github.io/repo-name
			// base: process.env.NODE_ENV === 'production' ? '/data-bit-3-sophia' : ''
			base: ''
		}
	}
};

export default config;
