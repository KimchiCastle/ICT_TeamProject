package vo.image;

public class ImageVo {
	
	int p_idx;	// 상품번호
	String sumimage;
	String imageFile1;
	String imageFile2;
	String imageFile3;
	String imageFile4;
	String imageFile5;
	
	
	public ImageVo() {
		// TODO Auto-generated constructor stub
	}
	

	public ImageVo(String sumimage, String imageFile1, String imageFile2, String imageFile3,
			String imageFile4, String imageFile5) {
		super();
		this.sumimage = sumimage;
		this.imageFile1 = imageFile1;
		this.imageFile2 = imageFile2;
		this.imageFile3 = imageFile3;
		this.imageFile4 = imageFile4;
		this.imageFile5 = imageFile5;
	}


	/**
	 * @return the p_idx
	 */
	public int getP_idx() {
		return p_idx;
	}


	/**
	 * @param p_idx the p_idx to set
	 */
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	/**
	 * @return the sumimage
	 */
	public String getSumimage() {
		return sumimage;
	}


	/**
	 * @param sumimage the sumimage to set
	 */
	public void setSumimage(String sumimage) {
		this.sumimage = sumimage;
	}


	/**
	 * @return the imageFile1
	 */
	public String getImageFile1() {
		return imageFile1;
	}


	/**
	 * @param imageFile1 the imageFile1 to set
	 */
	public void setImageFile1(String imageFile1) {
		this.imageFile1 = imageFile1;
	}


	/**
	 * @return the imageFile2
	 */
	public String getImageFile2() {
		return imageFile2;
	}


	/**
	 * @param imageFile2 the imageFile2 to set
	 */
	public void setImageFile2(String imageFile2) {
		this.imageFile2 = imageFile2;
	}


	/**
	 * @return the imageFile3
	 */
	public String getImageFile3() {
		return imageFile3;
	}


	/**
	 * @param imageFile3 the imageFile3 to set
	 */
	public void setImageFile3(String imageFile3) {
		this.imageFile3 = imageFile3;
	}


	/**
	 * @return the imageFile4
	 */
	public String getImageFile4() {
		return imageFile4;
	}


	/**
	 * @param imageFile4 the imageFile4 to set
	 */
	public void setImageFile4(String imageFile4) {
		this.imageFile4 = imageFile4;
	}


	/**
	 * @return the imageFile5
	 */
	public String getImageFile5() {
		return imageFile5;
	}


	/**
	 * @param imageFile5 the imageFile5 to set
	 */
	public void setImageFile5(String imageFile5) {
		this.imageFile5 = imageFile5;
	}
	
	
	
	
}
