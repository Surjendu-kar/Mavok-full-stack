import { defineHook } from '@directus/extensions-sdk';

export default defineHook(({ filter, action }) => {
	filter('items.create.accessories_type', () => {
		console.log('Creating Item!');
	});

	action('items.create.accessories_type', () => {
		console.log('Item created!');
	});
});
