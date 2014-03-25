package com.OnlineGridShop.audience.Entity;

import com.OnlineGridShop.brand.Entity.BrandgridGrid;
import com.OnlineGridShop.brand.Entity.BrandgridPreferential;
import com.OnlineGridShop.scattered.Entity.ScatteredGrid;
import com.OnlineGridShop.scattered.Entity.ScatteredGridPreferential;

public class AttentionGrid {
	private BrandgridGrid brandgridGrid;
	private ScatteredGrid scatteredGrid;
	private BrandgridPreferential brandgridPreferential;
	private ScatteredGridPreferential scatteredGridPreferential;

	public AttentionGrid() {
	}

	public AttentionGrid(BrandgridGrid brandgridGrid,
			ScatteredGrid scatteredGrid,
			BrandgridPreferential brandgridPreferential,
			ScatteredGridPreferential scatteredGridPreferential) {
		this.brandgridGrid=brandgridGrid;
		this.brandgridPreferential=brandgridPreferential;
		this.scatteredGrid=scatteredGrid;
		this.scatteredGridPreferential=scatteredGridPreferential;
	}

	public BrandgridGrid getBrandgridGrid() {
		return brandgridGrid;
	}

	public void setBrandgridGrid(BrandgridGrid brandgridGrid) {
		this.brandgridGrid = brandgridGrid;
	}

	public ScatteredGrid getScatteredGrid() {
		return scatteredGrid;
	}

	public void setScatteredGrid(ScatteredGrid scatteredGrid) {
		this.scatteredGrid = scatteredGrid;
	}

	public BrandgridPreferential getBrandgridPreferential() {
		return brandgridPreferential;
	}

	public void setBrandgridPreferential(
			BrandgridPreferential brandgridPreferential) {
		this.brandgridPreferential = brandgridPreferential;
	}

	public ScatteredGridPreferential getScatteredGridPreferential() {
		return scatteredGridPreferential;
	}

	public void setScatteredGridPreferential(
			ScatteredGridPreferential scatteredGridPreferential) {
		this.scatteredGridPreferential = scatteredGridPreferential;
	}
}
