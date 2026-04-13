<?php

class JWTManager {
    private static $secret_key = "ma_clé super_secrète_à_changer"; // À personnaliser et garder secret

    public static function generate($data) {
        $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);
        
        $duration = 3600 * 24; 
        $payload = json_encode([
            'user_id' => $data['user_id'], 
            'email'   => $data['email'],
            'exp'     => time() + $duration 
        ]);

        $base64UrlHeader = self::base64UrlEncode($header);
        $base64UrlPayload = self::base64UrlEncode($payload);

        $signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, self::$secret_key, true);
        $base64UrlSignature = self::base64UrlEncode($signature);

        return $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;
    }

    public static function validate($token) {
        $part = explode('.', $token);
        if (count($part) !== 3) return false;

        list($header, $payload, $signature) = $part;

        $validSignature = hash_hmac('sha256', $header . "." . $payload, self::$secret_key, true);
        if (self::base64UrlEncode($validSignature) !== $signature) {
            return false;
        }

        $payloadData = json_decode(self::base64UrlDecode($payload), true);

        if (isset($payloadData['exp']) && $payloadData['exp'] < time()) {
            return false;
        }

        return $payloadData;
    }

    private static function base64UrlEncode($data) {
        return str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($data));
    }

    private static function base64UrlDecode($data) {
        $remainder = strlen($data) % 4;
        if ($remainder) {
            $data .= str_repeat('=', 4 - $remainder);
        }
        return base64_decode(str_replace(['-', '_'], ['+', '/'], $data));
    }
}