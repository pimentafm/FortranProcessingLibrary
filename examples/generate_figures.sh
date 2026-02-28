#!/usr/bin/env bash
# Generate GMT figures for zonal statistics examples (ex07–ex10)
# Requires GMT >= 6.5.0
#
# Usage: cd examples && bash generate_figures.sh

set -euo pipefail

DB="database"
OUTDIR="../docs/static/img"
REGION="-R-51.4/-39.3/-23.1/-12.7"
PROJ="-JM15c"

# Temporary files to clean up
TMPFILES=()
cleanup() { rm -f "${TMPFILES[@]}"; }
trap cleanup EXIT

# ─────────────────────────────────────────────────────────────────────
# Helper: extract cattle time slice
# ─────────────────────────────────────────────────────────────────────
extract_cattle() {
    local idx=$1 outfile=$2
    gmt grdedit "${DB}/CATTLE19902012.nc?Cattle[${idx}]" -G"${outfile}"
    TMPFILES+=("${outfile}")
}

# ─────────────────────────────────────────────────────────────────────
# Helper: create Minas Gerais mask (UF=18 → 1, else NaN)
# ─────────────────────────────────────────────────────────────────────
make_mt_mask() {
    local outfile=$1
    gmt grdmath "${DB}/brazil_UF.nc?UF" 18 EQ 0 NAN = "${outfile}"
    TMPFILES+=("${outfile}")
}

# ─────────────────────────────────────────────────────────────────────
# Example 07: UF zones + soybean 2012 (all states)
# ─────────────────────────────────────────────────────────────────────
echo "Generating example_07.png ..."
gmt begin "${OUTDIR}/example_07" png

    gmt makecpt -Cviridis -T0.1/25/1 -Z --COLOR_BACKGROUND=white
    gmt grdimage "${DB}/LUCULTSOJA2012.nc?landuse" ${REGION} ${PROJ} -C -B+t"Soybean Land Use - 2012"
    gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf
    gmt colorbar -DJBC+w12c/0.4c+o0/0.8c -C -Bxaf+l"Soybean area (ha)"

gmt end

# ─────────────────────────────────────────────────────────────────────
# Example 08: Cattle density 2012 (all states)
# ─────────────────────────────────────────────────────────────────────
echo "Generating example_08.png ..."
extract_cattle 22 cattle_2012.nc

gmt begin "${OUTDIR}/example_08" png

    gmt makecpt -Chot -T0.1/5/0.25 -Z -I --COLOR_BACKGROUND=white
    gmt grdimage cattle_2012.nc ${REGION} ${PROJ} -C -B+t"Cattle Density - 2012"
    gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf
    gmt colorbar -DJBC+w12c/0.4c+o0/0.8c -C -Bxaf+l"Cattle density (head/ha)"

gmt end

# ─────────────────────────────────────────────────────────────────────
# Example 09: Soybean before/after masking to Minas Gerais (2 panels)
# ─────────────────────────────────────────────────────────────────────
echo "Generating example_09.png ..."
make_mt_mask mask_mt.nc
gmt grdmath "${DB}/LUCULTSOJA2012.nc?landuse" mask_mt.nc MUL = soja_masked.nc
TMPFILES+=(soja_masked.nc)

gmt begin "${OUTDIR}/example_09" png

    gmt makecpt -Cviridis -T0.1/25/1 -Z --COLOR_BACKGROUND=white

    gmt subplot begin 1x2 -Fs15c/15c -M0.8c -Aa+JTC+o0/0.2c -T"Soybean Land Use - Masking to Minas Gerais"
        gmt subplot set 0 -A"All States"
        gmt grdimage "${DB}/LUCULTSOJA2012.nc?landuse" ${REGION} ${PROJ} -C
        gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf

        gmt subplot set 1 -A"Minas Gerais Only"
        gmt grdimage soja_masked.nc ${REGION} ${PROJ} -C
        gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf
    gmt subplot end

    gmt colorbar -DJBC+w25c/0.4c+o0/0.8c -C -Bxaf+l"Soybean area (ha)"

gmt end

# ─────────────────────────────────────────────────────────────────────
# Example 10: Cattle 1990 vs 2012 masked to Minas Gerais (2 panels)
# ─────────────────────────────────────────────────────────────────────
echo "Generating example_10.png ..."
extract_cattle 0 cattle_1990.nc

# Re-use mask_mt.nc from ex09
gmt grdmath cattle_1990.nc mask_mt.nc MUL = cattle_1990_mt.nc
gmt grdmath cattle_2012.nc mask_mt.nc MUL = cattle_2012_mt.nc
TMPFILES+=(cattle_1990_mt.nc cattle_2012_mt.nc)

gmt begin "${OUTDIR}/example_10" png

    gmt makecpt -Chot -T0.1/5/0.25 -Z -I --COLOR_BACKGROUND=white

    gmt subplot begin 1x2 -Fs15c/15c -M0.8c -Aa+JTC+o0/0.2c -T"Cattle Density in Minas Gerais - 1990 vs 2012"
        gmt subplot set 0 -A"1990"
        gmt grdimage cattle_1990_mt.nc ${REGION} ${PROJ} -C
        gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf

        gmt subplot set 1 -A"2012"
        gmt grdimage cattle_2012_mt.nc ${REGION} ${PROJ} -C
        gmt coast ${REGION} ${PROJ} -N2/0.3p,gray30 -W1/0.2p,gray50 -Baf
    gmt subplot end

    gmt colorbar -DJBC+w25c/0.4c+o0/0.8c -C -Bxaf+l"Cattle density (head/ha)"

gmt end

echo "Done. Figures saved to ${OUTDIR}/"
