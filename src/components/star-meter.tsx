function StarSvg({ className }: { className?: string }) {
	return (
		<svg
			className={className}
			viewBox="0 0 24 24"
			fill="currentColor"
			aria-hidden={true}
			focusable={false}
		>
			<title>Star shape</title>
			<path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
		</svg>
	);
}

/** One star showing 0–100% fill (half stars and fractional averages). */
export function StarMeterSlot({
	fill,
	className = "size-7 sm:size-8",
}: {
	fill: number;
	className?: string;
}) {
	const pct = `${Math.min(100, Math.max(0, fill * 100))}%`;
	return (
		<span className={`relative inline-block shrink-0 ${className}`}>
			<StarSvg className={`pointer-events-none block text-gray-200 ${className}`} />
			<span
				className="pointer-events-none absolute bottom-0 left-0 top-0 overflow-hidden text-amber-400"
				style={{ width: pct }}
			>
				<StarSvg className={`block shrink-0 text-amber-400 ${className}`} />
			</span>
		</span>
	);
}

/** Five stars for a 0..5 rating (fractional averages or stored values). */
export function StarMeter({
	value,
	className,
	starClassName = "size-7 sm:size-8",
	ariaLabel,
}: {
	value: number;
	className?: string;
	starClassName?: string;
	ariaLabel: string;
}) {
	return (
		<div className={`flex gap-0.5 ${className ?? ""}`} role="img" aria-label={ariaLabel}>
			{([1, 2, 3, 4, 5] as const).map((i) => (
				<StarMeterSlot
					key={i}
					fill={Math.min(1, Math.max(0, value - (i - 1)))}
					className={starClassName}
				/>
			))}
		</div>
	);
}
