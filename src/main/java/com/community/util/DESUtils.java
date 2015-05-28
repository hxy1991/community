package com.community.util;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

/**
 * DES对称加密算法
 * 
 * */
public class DESUtils {
	/**
	 * 密钥算法 java支持56位密钥，bouncycastle支持64位
	 * */
	public static final String KEY_ALGORITHM = "DES";

	/**
	 * 加密/解密算法/工作模式/填充方式
	 * */
	public static final String CIPHER_ALGORITHM = "DES/ECB/PKCS5Padding";

	/**
	 * 转换密钥
	 * 
	 * @param key
	 *            二进制密钥
	 * @return Key 密钥
	 * */
	private static Key toKey(byte[] key) throws Exception {
		// 实例化Des密钥
		DESKeySpec dks = new DESKeySpec(key);
		// 实例化密钥工厂
		SecretKeyFactory keyFactory = SecretKeyFactory
				.getInstance(KEY_ALGORITHM);
		// 生成密钥
		SecretKey secretKey = keyFactory.generateSecret(dks);
		return secretKey;
	}

	/**
	 * 加密数据
	 * 
	 * @param data
	 *            待加密数据
	 * @param key
	 *            密钥
	 * @return byte[] 加密后的数据
	 * */
	private static byte[] encrypt(byte[] data, byte[] key) throws Exception {
		// 还原密钥
		Key k = toKey(key);
		// 实例化
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
		// 初始化，设置为加密模式
		cipher.init(Cipher.ENCRYPT_MODE, k);
		// 执行操作
		return cipher.doFinal(data);
	}

	/**
	 * 解密数据
	 * 
	 * @param data
	 *            待解密数据
	 * @param key
	 *            密钥
	 * @return byte[] 解密后的数据
	 * */
	private static byte[] decrypt(byte[] data, byte[] key) throws Exception {
		// 欢迎密钥
		Key k = toKey(key);
		// 实例化
		Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
		// 初始化，设置为解密模式
		cipher.init(Cipher.DECRYPT_MODE, k);
		// 执行操作
		return cipher.doFinal(data);
	}

	public static String encrypt(String text, String key) throws Exception {
		byte[] data = DESUtils.encrypt(text.getBytes(), key.getBytes());
		return new String(Base64.encodeBase64(data));
	}

	public static String decrypt(String text, String key) throws Exception {
		byte[] data = DESUtils.decrypt(Base64.decodeBase64(text.getBytes()),
				key.getBytes());
		return new String(data);
	}

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		String str = "DES";
		System.out.println("原文：" + str);
		// 初始化密钥
		String key = "mykey";
		// 加密数据
		String data = DESUtils.encrypt(str, key);
		System.out.println("加密后：" + data);
		// 解密数据
		data = DESUtils.decrypt(data, key);
		System.out.println("解密后：" + new String(data));
	}
}