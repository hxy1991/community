package com.community.util;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ImageScaleUtil {

    private static final Logger logger = LoggerFactory.getLogger(ImageScaleUtil.class);

    /**
     * 图片压缩
     * 
     * @param fromFile
     *            原图
     * @param toFile
     *            新图
     * @param width
     *            新图宽
     * @param height
     *            新图高
     * @param suffix
     *            图片后缀
     */
    public boolean compressImg(File fromFile, File toFile, int width, int height, String suffix) {
        if (!fromFile.isFile()) {
            logger.error(fromFile + " 图片无效！");
            return false;
        }
        FileOutputStream out = null;
        try {
            // 获取图片流
            Image imageFile = ImageIO.read(fromFile);
            // 压缩图片
            BufferedImage bufferedImage = getBufferedImage(imageFile, width, height);
            out = new FileOutputStream(toFile);
            ImageIO.write(bufferedImage, suffix, out);
        } catch (FileNotFoundException fnf) {
            logger.error("图片压缩异常！图片：{}异常：{}", fromFile, fnf);
            return false;
        } catch (IOException ioe) {
            logger.error(fromFile + "图片压缩异常！图片：{}异常：{}", fromFile, ioe);
            return false;
        } catch (Exception ioe) {
            logger.error(fromFile + "图片压缩异常！图片：{}异常：{}", fromFile, ioe);
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("图片压缩异常！{}", e);
                }
            }
        }
        return true;
    }

    /**
     * 等比例压缩
     * 
     * @param fromFile
     * @param toFile
     * @param Scale
     *            大于0 小于1 例如 0.25
     * @param suffix
     * @return
     */
    public boolean compressImg(File fromFile, File toFile, Double scale, String suffix) {
        if (!fromFile.isFile()) {
            logger.error(fromFile + " 图片无效！");
            return false;
        }
        FileOutputStream out = null;
        try {
            // 获取图片流
            Image imageFile = ImageIO.read(fromFile);
            // 压缩图片
            int width = (int) (((double) imageFile.getWidth(null)) * scale);
            int height = (int) (((double) imageFile.getHeight(null)) * scale);
            BufferedImage bufferedImage = getBufferedImage(imageFile, width, height);
            out = new FileOutputStream(toFile);
            ImageIO.write(bufferedImage, suffix, out);
        } catch (FileNotFoundException fnf) {
            logger.error("图片压缩异常！图片：{}异常：{}", fromFile, fnf);
            return false;
        } catch (IOException ioe) {
            logger.error(fromFile + "图片压缩异常！图片：{}异常：{}", fromFile, ioe);
            return false;
        } catch (Exception ioe) {
            logger.error(fromFile + "图片压缩异常！图片：{}异常：{}", fromFile, ioe);
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("图片压缩异常！{}", e);
                }
            }
        }
        return true;
    }

    /**
     * 压缩图片
     * 
     * @param imageFile
     * @param width
     * @param height
     * @return
     */
    private static BufferedImage getBufferedImage(Image imageFile, int width, int height) {
        ByteArrayOutputStream out = null;
        try {
            int imageWidth = imageFile.getWidth(null);
            int imageHeight = imageFile.getHeight(null);
            // 获取压缩比例，避免图片变形
            float scale = getScale(imageWidth, imageHeight, width, height);
            imageWidth = (int) (scale * imageWidth);
            imageHeight = (int) (scale * imageHeight);

            imageFile = imageFile.getScaledInstance(imageWidth, imageHeight, Image.SCALE_SMOOTH);
            BufferedImage bufferedImage = new BufferedImage(imageWidth, imageHeight, BufferedImage.SCALE_SMOOTH);
            Graphics2D g2d = bufferedImage.createGraphics();
            // 向画布上面画出图片
            g2d.drawImage(imageFile, 0, 0, imageWidth, imageHeight, Color.white, null);
            g2d.dispose();
            float kernelFactor = 0.01f;
            float[] kernelData = { 0, kernelFactor, 0, kernelFactor, 1 - (kernelFactor * 4), kernelFactor, 0,
                    kernelFactor, 0 };
            Kernel kernel = new Kernel(3, 3, kernelData);
            ConvolveOp convolveOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
            bufferedImage = convolveOp.filter(bufferedImage, null);
            return bufferedImage;
        } catch (Exception ioe) {
            logger.error("图片压缩异常！异常：{}", ioe);
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("图片压缩异常！{}", e);
                }
            }
        }
        return null;
    }

    /**
     * 通过图片流压缩图片 返回压缩后的图片流
     * 
     * @param inputStream
     * @param width
     * @param height
     * @param suffix
     * @return
     */
    public static ByteArrayInputStream compressImg(InputStream inputStream, int width, int height, String suffix) {
        ByteArrayOutputStream out = null;
        try {
            ImageIO.setUseCache(true);
            Image imageFile = ImageIO.read(inputStream);
            // 压缩图片
            BufferedImage bufferedImage = getBufferedImage(imageFile, width, height);
            out = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, suffix, out);
            return new ByteArrayInputStream(out.toByteArray());
        } catch (FileNotFoundException fnf) {
            logger.error("图片压缩异常！异常：{}", fnf);
        } catch (IOException ioe) {
            logger.error("图片压缩异常！异常：{}", ioe);
        } catch (Exception ioe) {
            logger.error("图片压缩异常！异常：{}", ioe);
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("图片压缩异常！{}", e);
                }
            }
        }
        return null;
    }
    
    /**
     * 等比例压缩
     * 
     * @param fromFile
     * @param toFile
     * @param Scale
     *            大于0 小于1 例如 0.25
     * @param suffix
     * @return
     */
    public static ByteArrayInputStream  compressImg(InputStream inputStream, Double scale, String suffix) {
        ByteArrayOutputStream out = null;
        try {
            Image imageFile = ImageIO.read(inputStream);
            // 压缩图片
            int width = (int) (((double) imageFile.getWidth(null)) * scale);
            int height = (int) (((double) imageFile.getHeight(null)) * scale);
            // 压缩图片
            BufferedImage bufferedImage = getBufferedImage(imageFile, width, height);
            out = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, suffix, out);
            return new ByteArrayInputStream(out.toByteArray());
        } catch (FileNotFoundException fnf) {
            logger.error("图片压缩异常！异常：{}", fnf);
        } catch (IOException ioe) {
            logger.error("图片压缩异常！异常：{}", ioe);
        } catch (Exception ioe) {
            logger.error("图片压缩异常！异常：{}", ioe);
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    logger.error("图片压缩异常！{}", e);
                }
            }
        }
        return null;
    }

    /**
     * 依据原图与新图的宽高计算压缩比例
     * 
     * @param fountainWidth
     * @param fountainHeight
     * @param newWidth
     * @param newHeight
     * @return
     */
    public static float getScale(int fountainWidth, int fountainHeight, int newWidth, int newHeight) {
        float scale = 1.0f;
        float widthScale = (float) newWidth / fountainWidth;
        float heightScale = (float) newHeight / fountainHeight;
        if (widthScale < 1.0 || heightScale < 1.0) {
            scale = widthScale <= heightScale ? widthScale : heightScale;
        }
        return scale;
    }

    public static void main(String[] args) throws IOException {
    
    }
}
