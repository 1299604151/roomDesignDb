import request from '@/utils/request'

// 查询用户浏览历史列表
export function listDsgnBrowsingHistory(query) {
  return request({
    url: '/dsgn/dsgnBrowsingHistory/list',
    method: 'get',
    params: query
  })
}

// 查询用户浏览历史详细
export function getDsgnBrowsingHistory(id) {
  return request({
    url: '/dsgn/dsgnBrowsingHistory/' + id,
    method: 'get'
  })
}

// 新增用户浏览历史
export function addDsgnBrowsingHistory(data) {
  return request({
    url: '/dsgn/dsgnBrowsingHistory',
    method: 'post',
    data: data
  })
}

// 修改用户浏览历史
export function updateDsgnBrowsingHistory(data) {
  return request({
    url: '/dsgn/dsgnBrowsingHistory',
    method: 'put',
    data: data
  })
}

// 删除用户浏览历史
export function delDsgnBrowsingHistory(id) {
  return request({
    url: '/dsgn/dsgnBrowsingHistory/' + id,
    method: 'delete'
  })
}
