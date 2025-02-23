#!/bin/zsh

# 設定: 各自の環境に合わせて値を変更してください
SUBDOMAIN="your_subdomain"      # 例: example （例: https://example.cybozu.com）
APP_ID="your_app_id"            # 対象のアプリID
API_TOKEN="your_api_token"      # APIトークン

# Fields API のエンドポイント URL（POSTメソッドでリクエストボディを渡す）
URL="https://${SUBDOMAIN}.cybozu.com/k/v1/app/form/fields.json"

# リクエストボディ（JSON形式で app パラメータを指定）
BODY=$(cat <<EOF
{
  "app": "${APP_ID}",
  "lang": "ja"
}
EOF
)

# curl を使って GET リクエストを実行し、結果を jq で整形して表示
curl -X GET "${URL}" \
  -H "X-Cybozu-API-Token: ${API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d "${BODY}" | jq .
