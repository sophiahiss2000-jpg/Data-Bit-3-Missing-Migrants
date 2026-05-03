<script>
	import { onMount } from 'svelte';
	import * as d3 from 'd3';

	let { years, mediterranean, northAfrica } = $props();

	let container = $state(null);
	let width = $state(0);

	const HEIGHT = 280;
	const MARGIN = { top: 16, right: 12, bottom: 36, left: 52 };

	const COLOR_SEA  = '#2563a8';
	const COLOR_SAND = '#c04a1e';

	let innerW = $derived(Math.max(width - MARGIN.left - MARGIN.right, 100));
	let innerH = $derived(HEIGHT - MARGIN.top - MARGIN.bottom);

	let data = $derived(years.map((y, i) => ({
		year: String(y),
		med: mediterranean[i],
		sah: northAfrica[i]
	})));

	let xScale = $derived(d3.scaleBand()
		.domain(data.map(d => d.year))
		.range([0, innerW])
		.paddingInner(0.22)
		.paddingOuter(0.08));

	let yMax = $derived(d3.max(data, d => Math.max(d.med, d.sah)) ?? 6000);

	let yScale = $derived(d3.scaleLinear()
		.domain([0, Math.ceil(yMax / 1000) * 1000])
		.range([innerH, 0]));

	let yTicks = $derived(yScale.ticks(5));
	let barW = $derived(xScale.bandwidth());
	let halfW = $derived(barW / 2);

	function fmt(n) {
		return n >= 1000 ? (n / 1000).toFixed(1) + 'k' : String(n);
	}

	onMount(() => {
		const ro = new ResizeObserver(entries => {
			width = entries[0].contentRect.width;
		});
		ro.observe(container);
		return () => ro.disconnect();
	});
</script>

<div bind:this={container} class="chart-wrap">
	{#if width > 0}
	<svg
		role="img"
		aria-label="Bar chart: migrant deaths Mediterranean vs Northern Africa 2014–2024"
		{width}
		height={HEIGHT}
	>
		<title>Migrant deaths: Mediterranean vs Northern Africa (Sahara routes), 2014–2024</title>
		<g transform="translate({MARGIN.left},{MARGIN.top})">

			{#each yTicks as tick}
				<line x1={0} x2={innerW} y1={yScale(tick)} y2={yScale(tick)}
					stroke="#ccc5bb" stroke-width="0.5"
					stroke-dasharray={tick === 0 ? 'none' : '3,3'} />
				<text x={-8} y={yScale(tick)} text-anchor="end" dominant-baseline="middle"
					font-family="'DM Sans', sans-serif" font-size="11" fill="#8a837a">{fmt(tick)}</text>
			{/each}

			{#each data as d}
				{@const x = xScale(d.year) ?? 0}
				<rect x={x} y={yScale(d.med)} width={halfW - 1} height={innerH - yScale(d.med)}
					fill={COLOR_SEA} opacity="0.82" />
				<rect x={x + halfW + 1} y={yScale(d.sah)} width={halfW - 1} height={innerH - yScale(d.sah)}
					fill="none" stroke={COLOR_SAND} stroke-width="1.5" stroke-dasharray="4 2" />
				<text x={x + barW / 2} y={innerH + 18} text-anchor="middle"
					font-family="'DM Sans', sans-serif" font-size="11" fill="#8a837a">{d.year.slice(2)}</text>
			{/each}

			<line x1={0} x2={innerW} y1={innerH} y2={innerH} stroke="#1a1714" stroke-width="1" />
		</g>
	</svg>
	{/if}
</div>

<style>
	.chart-wrap { width: 100%; overflow: hidden; }
</style>
