Rest api - vsphere (get templates)
 
 
1 - login
curl -k -X POST --basic -u administrator@vsphere.local https://192.168.222.10/rest/com/vmware/cis/session | python -m json.tool
Enter host password for user 'administrator@vsphere.local':
 
{
    "value": "a8f1968aed830dc983a74c236f5328ff"
}
 
 
2 - get all content libraries
curl -k -H "vmware-api-session-id:a8f1968aed830dc983a74c236f5328ff" https://192.168.222.10/rest/com/vmware/content/library | python -m json.tool
 
{
    "value": [
        "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa"
    ]
}
 
 
3 - get content library  "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa" details
curl -k -H "vmware-api-session-id:a8f1968aed830dc983a74c236f5328ff" https://192.168.222.10/rest/com/vmware/content/library/id:33a49b2f-3a04-4fa9-8f6b-9f9286c975aa | python -m json.tool
 
{
    "value": {
        "creation_time": "2020-03-16T16:12:51.742Z",
        "description": "",
        "id": "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa",
        "last_modified_time": "2020-03-16T16:12:51.742Z",
        "name": "TEMP1",
        "optimization_info": {
            "optimize_remote_publishing": false
        },
        "publish_info": {
            "authentication_method": "NONE",
            "persist_json_enabled": false,
            "publish_url": "https://192.168.222.10:443/cls/vcsp/lib/33a49b2f-3a04-4fa9-8f6b-9f9286c975aa/lib.json",
            "published": true,
            "user_name": "vcsp"
        },
        "server_guid": "13bac586-022d-4725-9715-35617130e777",
        "storage_backings": [
            {
                "datastore_id": "datastore-33",
                "type": "DATASTORE"
            }
        ],
        "type": "LOCAL",
        "version": "2"
    }
}
 
 
4 - get items in content library "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa"
curl -k -H "vmware-api-session-id:a8f1968aed830dc983a74c236f5328ff" https://192.168.222.10/rest/com/vmware/content/library/item?library_id=33a49b2f-3a04-4fa9-8f6b-9f9286c975aa | python -m json.tool
 
{
    "value": [
        "cf016624-9dba-4f79-9f4c-3d66f859e78e",
        "4e29ee9a-0e8c-4cc4-8b1c-0d3edd418834"
    ]
}
 
5 - get details of item "cf016624-9dba-4f79-9f4c-3d66f859e78e"
curl -k -H "vmware-api-session-id:a8f1968aed830dc983a74c236f5328ff" https://192.168.222.10/rest/com/vmware/content/library/item/id:4e29ee9a-0e8c-4cc4-8b1c-0d3edd418834 | python -m json.tool
 
{
    "value": {
        "cached": true,
        "content_version": "2",
        "creation_time": "2020-03-16T18:31:11.944Z",
        "description": "",
        "id": "4e29ee9a-0e8c-4cc4-8b1c-0d3edd418834",
        "last_modified_time": "2020-03-16T18:31:55.701Z",
        "library_id": "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa",
        "metadata_version": "1",
        "name": "win2019temp",
        "size": 15726813688,
        "type": "vm-template",
        "version": "1"
    }
}
 
 
6 - get details of item "4e29ee9a-0e8c-4cc4-8b1c-0d3edd418834"
curl -k -H "vmware-api-session-id:a8f1968aed830dc983a74c236f5328ff" https://192.168.222.10/rest/com/vmware/content/library/item/id:cf016624-9dba-4f79-9f4c-3d66f859e78e | python -m json.tool
 
{
    "value": {
        "cached": true,
        "content_version": "2",
        "creation_time": "2020-03-16T18:53:49.407Z",
        "description": "",
        "id": "cf016624-9dba-4f79-9f4c-3d66f859e78e",
        "last_modified_time": "2020-03-16T18:53:56.989Z",
        "library_id": "33a49b2f-3a04-4fa9-8f6b-9f9286c975aa",
        "metadata_version": "1",
        "name": "skyline",
        "size": 1991254508,
        "type": "vm-template",
        "version": "1"
    }
}
 