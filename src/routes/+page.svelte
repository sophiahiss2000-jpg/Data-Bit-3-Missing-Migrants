<script>
	import { onMount } from 'svelte';
	import Chart from '$lib/Chart.svelte';

	let mounted = $state(false);
	onMount(() => { mounted = true; });

	const years = [2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024];
	const mediterranean = [3286,4055,5097,3139,2337,1885,1440,2047,2411,3155,2573];
	const northAfrica   = [90,  736, 1405,1030, 676, 859, 601, 1428, 755, 844, 833];

	const medTotal   = mediterranean.reduce((a,b) => a+b, 0);
	const sahTotal   = northAfrica.reduce((a,b) => a+b, 0);
	const combinedTotal = medTotal + sahTotal;
</script>

<svelte:head>
	<title>The Deaths We Don't Count</title>
</svelte:head>

<main>
	<!-- Dateline strip -->
	<div class="dateline-strip">
		<span>Missing Migrants Project · IOM · 2014–2024</span>
	</div>

	<article>
		<!-- Headline -->
		<header class="article-header">
			<h1>The Deaths We Don't Count</h1>
			<p class="deck">
				The Mediterranean dominates headlines. But the deadliest leg
				of the journey often ends in the sand, without a witness.
			</p>
		</header>

		<!-- Stat row -->
		<div class="stat-row">
			<div class="stat-card sea">
				<span class="stat-label">Mediterranean</span>
				<span class="stat-number">{medTotal.toLocaleString()}</span>
				<span class="stat-sub">dead &amp; missing, 2014–2024</span>
			</div>
			<div class="stat-divider">vs.</div>
			<div class="stat-card sand">
				<span class="stat-label">Northern Africa (Sahara routes)</span>
				<span class="stat-number">{sahTotal.toLocaleString()}</span>
				<span class="stat-sub">recorded — almost certainly a fraction of the true toll</span>
			</div>
		</div>

		<!-- Visualization -->
		<figure class="chart-figure">
			<figcaption class="chart-caption-top">
				Dead &amp; missing per year — two routes, one journey
			</figcaption>
			{#if mounted}
				<Chart {years} {mediterranean} {northAfrica} />
			{/if}
			<div class="chart-legend">
				<span class="legend-item sea">
					<span class="legend-swatch sea"></span>
					Mediterranean (recorded)
				</span>
				<span class="legend-item sand">
					<span class="legend-swatch sand"></span>
					Northern Africa / Sahara (minimum estimate)
				</span>
			</div>
			<p class="chart-source">
				Source: Missing Migrants Project, International Organization for Migration (IOM).
				Northern Africa figures are widely understood to be a significant undercount —
				the Sahara returns few bodies and fewer records.
			</p>
		</figure>

		<!-- Body text -->
		<div class="body-text">
			<p>
				The Mediterranean has become the defining image of migration tragedy.
				Overcrowded boats, coast guard rescues, body counts on the evening news.
				But according to UNHCR, the deadliest stretch of the journey often happens long before
				anyone reaches the water.
			</p>

		<!-- Pull quote / hook -->
		<div class="hook-block">
			<div class="hook-rule"></div>
			<blockquote class="hook-quote">
				"For every death in the Mediterranean,<br />
				there are at least two in the Sahara.<br />
				<em>Unknown and anonymous.</em>"
			</blockquote>
			<cite class="hook-cite">
				Alessandra Morelli — Head of UNHCR Niger
			</cite>
			<div class="hook-rule"></div>
		</div>

			<p>
				Data from the IOM's Missing Migrants Project — tracking migrant deaths
				globally since 2014 In the Mediterranean, between 2014 and 2024,
				at least <strong>{medTotal.toLocaleString()} people</strong> died or went missing.
				The numbers are grim, but they exist: the sea returns bodies.
				Investigations happen. NGOs monitor. 
			</p>
			<p>
				In Northern Africa — the Sahara crossing routes that feed into , Algeria and Morocco — the same decade recorded just
				<strong>{sahTotal.toLocaleString()} deaths</strong>.
				That sounds like less. It isn't.
			</p>
			<div class="aside-block">
				<p>
					The most common cause-of-death entry for Northern Africa in the dataset
					is simply: <em>"mixed or unknown."</em> Exposure, thirst, vehicle accidents
					on unmarked tracks, violence — all folded into a category that quietly
					admits: "we don't know.""
				</p>
			</div>
			<p>
				The chart above reflects the stark asymmetry. The Mediterranean
				bar is tall — visible, counted, reported. The Sahara figure is an
				outline: a floor, not a ceiling. Every number it contains is a minimum.
				The people it doesn't contain are the ones Morelli is talking about.
			</p>
			<p>
				But her warning is not a metaphor. It's a data problem.
				The Sahara swallows evidence. People die in remote desert stretches
				without witnesses, without documentation, without coordinates.
				The true toll is almost certainly several times higher.
			</p>
			<p>
				Part of the problem is the scarcity of organisations willing and able to
				do the work. In the Mediterranean, a constellation of civil rescue missions
				monitor the crossing around the clock, with boats, planes, and dedicated
				funding. The Sahara has almost none of that. The most reliable independent
				source tracking deaths on the overland routes is
				<a href="https://alarmephonesahara.info/en" target="_blank" rel="noopener">Alarm Phone Sahara</a>,
				a volunteer-run network documenting disappearances and deaths along routes
				through Niger, Libya, Algeria, and Mali. They operate on a fraction of the
				resources that flow to maritime rescue, and remain far less known outside
				specialist circles. The IOM also collects data in the region, but its mandate
				in many of these countries is primarily focused on assisted voluntary returns —
				a fundamentally different mission that limits both access and the scope of
				what gets recorded.
			</p>

			<div class="aside-block aside-sea">
				<p>
					The Sahara is not just under-monitored — it is very difficult to reach for outsiders.
					Vast, roadless stretches of desert. Militias controlling migration corridors.
					The situation has deteriorated more sharply in recent
					years. The war in Mali and the military coup in Niger have effectively overthrown
					what remained of functioning state authority along key transit routes, making it
					nearly impossible to identify — let alone cooperate with — any reliable local
					counterpart.
		</div>

			
	</article>

	<footer class="site-footer">
		<p>Data: <a href="https://missingmigrants.iom.int" target="_blank" rel="noopener">Missing Migrants Project</a> · IOM · 2014–2024</p>
		<p>Built with SvelteKit &amp; D3.js</p>
	</footer>
</main>

<style>
	main {
		min-height: 100vh;
		padding-bottom: 4rem;
	}

	/* Dateline */
	.dateline-strip {
		background: var(--ink);
		color: var(--parchment);
		font-family: var(--font-body);
		font-size: 0.65rem;
		font-weight: 500;
		letter-spacing: 0.12em;
		text-transform: uppercase;
		text-align: center;
		padding: 0.55rem 1rem;
	}

	article {
		max-width: 760px;
		margin: 0 auto;
		padding: 0 1.5rem;
	}

	/* Hook / pull quote */
	.hook-block {
		margin: 3.5rem 0 2.5rem;
		text-align: center;
	}

	.hook-rule {
		height: 1px;
		background: var(--rule);
		margin: 1rem auto;
		width: 120px;
	}

	.hook-quote {
		font-family: var(--font-display);
		font-size: clamp(1.15rem, 3vw, 1.55rem);
		font-weight: 400;
		font-style: italic;
		line-height: 1.55;
		color: var(--ink);
		border: none;
		padding: 0;
		margin: 0;
	}

	.hook-quote em {
		color: var(--accent-sand);
	}

	.hook-cite {
		display: block;
		margin-top: 1rem;
		font-family: var(--font-body);
		font-size: 0.7rem;
		font-weight: 500;
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--ink-faint);
		font-style: normal;
	}

	/* Article header */
	.article-header {
		margin: 2.5rem 0 2rem;
		border-top: 3px double var(--rule);
		padding-top: 2rem;
	}

	h1 {
		font-family: var(--font-display);
		font-size: clamp(2rem, 5vw, 3.2rem);
		font-weight: 700;
		line-height: 1.1;
		letter-spacing: -0.01em;
		color: var(--ink);
		margin-bottom: 0.75rem;
	}

	.deck {
		font-size: 1.05rem;
		font-weight: 300;
		color: var(--ink-light);
		line-height: 1.6;
		border-left: 2px solid var(--rule);
		padding-left: 1rem;
		margin-top: 0.5rem;
	}

	/* Stat row */
	.stat-row {
		display: flex;
		align-items: center;
		gap: 1rem;
		margin: 2.5rem 0;
		flex-wrap: wrap;
	}

	.stat-card {
		flex: 1;
		min-width: 200px;
		background: var(--parchment-dark);
		border: 1px solid var(--rule);
		padding: 1.25rem 1.5rem;
		display: flex;
		flex-direction: column;
		gap: 0.2rem;
	}

	.stat-card.sea {
		border-top: 3px solid var(--accent-sea);
	}

	.stat-card.sand {
		border-top: 3px solid var(--accent-sand);
	}

	.stat-label {
		font-size: 0.65rem;
		font-weight: 500;
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--ink-faint);
	}

	.stat-number {
		font-family: var(--font-display);
		font-size: 2.4rem;
		font-weight: 700;
		line-height: 1.1;
		color: var(--ink);
	}

	.stat-card.sea .stat-number { color: var(--accent-sea); }
	.stat-card.sand .stat-number { color: var(--accent-sand); }

	.stat-sub {
		font-size: 0.72rem;
		color: var(--ink-faint);
		line-height: 1.4;
	}

	.stat-divider {
		font-family: var(--font-display);
		font-size: 1.4rem;
		font-style: italic;
		color: var(--rule);
		flex-shrink: 0;
	}

	/* Chart */
	.chart-figure {
		margin: 2rem 0 2.5rem;
		border: 1px solid var(--rule);
		padding: 1.5rem;
		background: var(--parchment-dark);
	}

	.chart-caption-top {
		font-size: 0.68rem;
		font-weight: 500;
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--ink-faint);
		margin-bottom: 1rem;
	}

	.chart-legend {
		display: flex;
		flex-wrap: wrap;
		gap: 1.25rem;
		margin-top: 1rem;
		font-size: 0.72rem;
		color: var(--ink-light);
	}

	.legend-item {
		display: flex;
		align-items: center;
		gap: 6px;
	}

	.legend-swatch {
		width: 14px;
		height: 10px;
		display: inline-block;
		flex-shrink: 0;
	}

	.legend-swatch.sea { background: var(--accent-sea); opacity: 0.8; }
	.legend-swatch.sand {
		background: transparent;
		border: 2px dashed var(--accent-sand);
	}

	.chart-source {
		font-size: 0.65rem;
		color: var(--ink-faint);
		margin-top: 1rem;
		line-height: 1.5;
		border-top: 1px solid var(--rule);
		padding-top: 0.75rem;
	}

	/* Body text */
	.body-text {
		font-size: 1rem;
		line-height: 1.8;
		color: var(--ink);
	}

	.body-text p {
		margin-bottom: 1.4rem;
	}

	.body-text strong {
		font-weight: 500;
	}

	.aside-block {
		border-left: 3px solid var(--accent-sand);
		margin: 2rem 0;
		padding: 1rem 1.25rem;
		background: var(--accent-sand-pale);
	}

	.aside-block p {
		margin: 0;
		font-size: 0.95rem;
		color: var(--ink-light);
	}

	.closing {
		font-family: var(--font-display);
		font-style: italic;
		font-size: 1.15rem;
		line-height: 1.6;
		color: var(--ink);
		border-top: 1px solid var(--rule);
		padding-top: 1.5rem;
		margin-top: 2rem !important;
	}

	/* Footer */
	.site-footer {
		margin-top: 4rem;
		padding: 2rem 1.5rem;
		border-top: 1px solid var(--rule);
		text-align: center;
		font-size: 0.7rem;
		color: var(--ink-faint);
		letter-spacing: 0.05em;
		display: flex;
		flex-direction: column;
		gap: 0.3rem;
	}

	.site-footer a {
		color: var(--accent-sea);
		text-decoration: none;
	}

	.site-footer a:hover {
		text-decoration: underline;
	}

	/* Responsive */
	@media (max-width: 560px) {
		.stat-divider { display: none; }
		.stat-row { flex-direction: column; }
		.stat-card { min-width: 100%; }
		.hook-quote { font-size: 1.1rem; }
	}
</style>
